describe Spaceship::Client do
  before { Spaceship.login }
  subject { Spaceship.client }
  let(:username) { 'spaceship@krausefx.com' }
  let(:password) { 'so_secret' }

  describe '#login' do
    it 'sets the session cookies' do
      response = subject.login(username, password)
      expect(response.env.request_headers['Cookie']).to eq('myacinfo=abcdef')
    end

    it 'raises an exception if authentication failed' do
      expect do
        subject.login('bad-username', 'bad-password')
      end.to raise_exception(Spaceship::Client::InvalidUserCredentialsError)
    end
  end

  context 'authenticated' do
    before { subject.login(username, password) }
    describe '#teams' do
      let(:teams) { subject.teams }
      it 'returns the list of available teams' do
        expect(teams).to be_instance_of(Array)
        expect(teams.first.keys).to eq(["status", "teamId", "type", "extendedTeamAttributes", "teamAgent", "memberships", "currentTeamMember", "name"])
      end
    end

    describe '#team_id' do
      it 'returns the default team_id' do
        expect(subject.team_id).to eq('XXXXXXXXXX')
      end

      it "set custom Team ID" do
        team_id = "ABCDEF"
        subject.team_id = team_id
        expect(subject.team_id).to eq(team_id)
      end

      it "shows a warning when user is in multiple teams and didn't call select_team" do
        PortalStubbing.adp_stub_multiple_teams
        expect(subject.team_id).to eq("SecondTeam")
      end
    end

    describe "csrf_tokens" do
      it "uses the stored token for all upcoming requests" do
        # Temporary stub a request to require the csrf_tokens
        stub_request(:post, 'https://developer.apple.com/services-account/QH65B2/account/ios/device/listDevices.action').
          with(body: { teamId: 'XXXXXXXXXX', pageSize: "10", pageNumber: "1", sort: 'name=asc', includeRemovedDevices: "false" }, headers: { 'csrf' => 'top_secret', 'csrf_ts' => '123123' }).
          to_return(status: 200, body: PortalStubbing.adp_read_fixture_file('listDevices.action.json'), headers: { 'Content-Type' => 'application/json' })

        # Hard code the tokens
        allow(subject).to receive(:csrf_tokens).and_return({ csrf: 'top_secret', csrf_ts: '123123' })
        allow(subject).to receive(:page_size).and_return(10) # to have a separate stubbing

        expect(subject.devices.count).to eq(4)
      end
    end

    describe '#apps' do
      let(:apps) { subject.apps }
      it 'returns a list of apps' do
        expect(apps).to be_instance_of(Array)
        expect(apps.first.keys).to eq(["appIdId", "name", "appIdPlatform", "prefix", "identifier", "isWildCard", "isDuplicate", "features", "enabledFeatures", "isDevPushEnabled", "isProdPushEnabled", "associatedApplicationGroupsCount", "associatedCloudContainersCount", "associatedIdentifiersCount"])
      end
    end

    describe '#app_groups' do
      let(:app_groups) { subject.app_groups }
      it 'returns a list of apps' do
        expect(app_groups).to be_instance_of(Array)
        expect(app_groups.first.keys).to eq(["name", "prefix", "identifier", "status", "applicationGroup"])
      end
    end

    describe "#team_information" do
      it 'returns all available information' do
        s = subject.team_information
        expect(s['status']).to eq('active')
        expect(s['type']).to eq('Company/Organization')
        expect(s['name']).to eq('SpaceShip')
      end
    end

    describe "#in_house?" do
      it 'returns false for normal accounts' do
        expect(subject.in_house?).to eq(false)
      end

      it 'returns true for enterprise accounts' do
        PortalStubbing.adp_stub_multiple_teams

        subject.team_id = 'SecondTeam'
        expect(subject.in_house?).to eq(true)
      end
    end

    describe '#create_app' do
      it 'should make a request create an explicit app id' do
        response = subject.create_app!(:explicit, 'Production App', 'tools.fastlane.spaceship.some-explicit-app')
        expect(response['isWildCard']).to eq(false)
        expect(response['name']).to eq('Production App')
        expect(response['identifier']).to eq('tools.fastlane.spaceship.some-explicit-app')
      end

      it 'should make a request create a wildcard app id' do
        response = subject.create_app!(:wildcard, 'Development App', 'tools.fastlane.spaceship.*')
        expect(response['isWildCard']).to eq(true)
        expect(response['name']).to eq('Development App')
        expect(response['identifier']).to eq('tools.fastlane.spaceship.*')
      end

      it 'should strip non ASCII characters' do
        response = subject.create_app!(:explicit, 'pp Test 1ed9e25c93ac7142ff9df53e7f80e84c', 'tools.fastlane.spaceship.some-explicit-app')
        expect(response['isWildCard']).to eq(false)
        expect(response['name']).to eq('pp Test 1ed9e25c93ac7142ff9df53e7f80e84c')
        expect(response['identifier']).to eq('tools.fastlane.spaceship.some-explicit-app')
      end

      it 'should make a request create an explicit app id with no push feature' do
        payload = {}
        payload[Spaceship.app_service.push_notification.on.service_id] = Spaceship.app_service.push_notification.on
        response = subject.create_app!(:explicit, 'Production App', 'tools.fastlane.spaceship.some-explicit-app', enable_services: payload)
        expect(response['enabledFeatures']).to_not include("push")
        expect(response['identifier']).to eq('tools.fastlane.spaceship.some-explicit-app')
      end
    end

    describe '#delete_app!' do
      it 'should make a request to delete the app' do
        response = subject.delete_app!('LXD24VUE49')
        expect(response['resultCode']).to eq(0)
      end
    end

    describe '#create_app_group' do
      it 'should make a request create an app group' do
        response = subject.create_app_group!('Production App Group', 'group.tools.fastlane.spaceship')
        expect(response['name']).to eq('Production App Group')
        expect(response['identifier']).to eq('group.tools.fastlane')
      end
    end

    describe '#delete_app_group' do
      it 'should make a request to delete the app group' do
        response = subject.delete_app_group!('2GKKV64NUG')
        expect(response['resultCode']).to eq(0)
      end
    end

    describe "#paging" do
      it "default page size is correct" do
        expect(subject.page_size).to eq(500)
      end

      it "Properly pages if required with support for a custom page size" do
        allow(subject).to receive(:page_size).and_return(8)

        expect(subject.devices.count).to eq(9)
        expect(subject.devices.last['name']).to eq("The last phone")
      end
    end

    describe '#devices' do
      let(:devices) { subject.devices }
      it 'returns a list of device hashes' do
        expect(devices).to be_instance_of(Array)
        expect(devices.first.keys).to eq(["deviceId", "name", "deviceNumber", "devicePlatform", "status", "model", "deviceClass"])
      end
    end

    describe '#certificates' do
      let(:certificates) { subject.certificates(["5QPB9NHCEI"]) }
      it 'returns a list of certificates hashes' do
        expect(certificates).to be_instance_of(Array)
        expect(certificates.first.keys).to eq(
          %w(certRequestId name statusString dateRequestedString dateRequested
             dateCreated expirationDate expirationDateString ownerType ownerName
             ownerId canDownload canRevoke certificateId certificateStatusCode
             certRequestStatusCode certificateTypeDisplayId serialNum typeString)
        )
      end
    end

    describe "#create_device" do
      it "works as expected when the name is free" do
        device = subject.create_device!("Demo Device", "7f6c8dc83d77134b5a3a1c53f1202b395b04482b")
        expect(device['name']).to eq("Demo Device")
        expect(device['deviceNumber']).to eq("7f6c8dc83d77134b5a3a1c53f1202b395b04482b")
        expect(device['devicePlatform']).to eq('ios')
        expect(device['status']).to eq('c')
      end
    end

    describe '#provisioning_profiles' do
      it 'makes a call to the developer portal API' do
        profiles = subject.provisioning_profiles
        expect(profiles).to be_instance_of(Array)
        expect(profiles.sample.keys).to include("provisioningProfileId",
                                                "name",
                                                "status",
                                                "type",
                                                "distributionMethod",
                                                "proProPlatform",
                                                "version",
                                                "dateExpire",
                                                "managingApp",
                                                "deviceIds",
                                                "certificateIds")
        expect(a_request(:post, 'https://developer.apple.com/services-account/QH65B2/account/ios/profile/listProvisioningProfiles.action')).to have_been_made
      end
    end

    describe '#provisioning_profiles_via_xcode_api' do
      it 'makes a call to the developer portal API' do
        profiles = subject.provisioning_profiles_via_xcode_api
        expect(profiles).to be_instance_of(Array)
        expect(profiles.sample.keys).to include("provisioningProfileId",
                                                "name",
                                                "status",
                                                "type",
                                                "distributionMethod",
                                                "proProPlatform",
                                                "version",
                                                "dateExpire",
                                                # "managingApp", not all profiles have it
                                                "deviceIds",
                                                "appId",
                                                "certificateIds")
        expect(a_request(:post, /developerservices2.apple.com/)).to have_been_made
      end
    end

    describe "#create_provisioning_profile" do
      it "works when the name is free" do
        response = subject.create_provisioning_profile!("net.sunapps.106 limited", "limited", 'R9YNDTPLJX', ['C8DL7464RQ'], ['C8DLAAAARQ'])
        expect(response.keys).to include('name', 'status', 'type', 'appId', 'deviceIds')
        expect(response['distributionMethod']).to eq('limited')
      end

      it "works when the name is already taken" do
        error_text = 'Multiple profiles found with the name &#x27;Test Name 3&#x27;.  Please remove the duplicate profiles and try again.\nThere are no current certificates on this team matching the provided certificate IDs.' # not ", as this would convert the \n
        expect do
          response = subject.create_provisioning_profile!("taken", "limited", 'R9YNDTPLJX', ['C8DL7464RQ'], ['C8DLAAAARQ'])
        end.to raise_error(Spaceship::Client::UnexpectedResponse, error_text)
      end

      it "works when subplatform is null and mac is false" do
        response = subject.create_provisioning_profile!("net.sunapps.106 limited", "limited", 'R9YNDTPLJX', ['C8DL7464RQ'], ['C8DLAAAARQ'], mac: false, sub_platform: nil)
        expect(response.keys).to include('name', 'status', 'type', 'appId', 'deviceIds')
        expect(response['distributionMethod']).to eq('limited')
      end
    end

    describe '#delete_provisioning_profile!' do
      it 'makes a requeset to delete a provisioning profile' do
        response = subject.delete_provisioning_profile!('2MAY7NPHRU')
        expect(response['resultCode']).to eq(0)
      end
    end

    describe '#create_certificate' do
      let(:csr) { PortalStubbing.adp_read_fixture_file('certificateSigningRequest.certSigningRequest') }
      it 'makes a request to create a certificate' do
        response = subject.create_certificate!('BKLRAVXMGM', csr, '2HNR359G63')
        expect(response.keys).to include('certificateId', 'certificateType', 'statusString', 'expirationDate', 'certificate')
      end
    end

    describe '#revoke_certificate' do
      it 'makes a revoke request and returns the revoked certificate' do
        response = subject.revoke_certificate!('XC5PH8DAAA', 'R58UK2EAAA')
        expect(response.first.keys).to include('certificateId', 'certificateType', 'certificate')
      end
    end
  end
end
