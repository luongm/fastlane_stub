require_relative 'spaceship_stub/spaceship/spec/client_stubbing'
require_relative 'spaceship_stub/spaceship/spec/portal/portal_stubbing'
require_relative 'spaceship_stub/spaceship/spec/tunes/tunes_stubbing'
require_relative 'spaceship_stub/spaceship/spec/du/du_stubbing'

module SpaceshipStub
  class << self
    def stub
      # Ensure that no ENV vars which interfere with testing are set
      set_auth_vars = [
        'FASTLANE_SESSION',
        'FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD',
        'FASTLANE_PASSWORD'
      ].select { |var| ENV.key?(var) }

      if set_auth_vars.any?
        abort "[!] Please `unset` the following ENV vars which interfere with spaceship testing: #{set_auth_vars.join(', ')}".red
      end

      @cache_paths = [
        File.expand_path("/tmp/spaceship_itc_service_key.txt")
      ]

      @cache_paths.each { |path| try_delete path }
      ENV["DELIVER_USER"] = "spaceship@krausefx.com"
      ENV["DELIVER_PASSWORD"] = "so_secret"
      ENV['SPACESHIP_AVOID_XCODE_API'] = 'true'

      ENV.delete("FASTLANE_USER")

      TunesStubbing.itc_stub_login
      PortalStubbing.adp_stub_login

      PortalStubbing.adp_stub_app_groups
      PortalStubbing.adp_stub_apps

      PortalStubbing.adp_stub_provisioning
      PortalStubbing.adp_stub_certificates
      PortalStubbing.adp_stub_devices
      PortalStubbing.adp_stub_persons
      PortalStubbing.adp_stub_website_pushes

      TunesStubbing.itc_stub_applications
      TunesStubbing.itc_stub_app_versions
      TunesStubbing.itc_stub_build_trains
      TunesStubbing.itc_stub_testers
      TunesStubbing.itc_stub_testflight
      TunesStubbing.itc_stub_app_version_ref
      TunesStubbing.itc_stub_user_detail
      TunesStubbing.itc_stub_sandbox_testers
      TunesStubbing.itc_stub_create_sandbox_tester
      TunesStubbing.itc_stub_delete_sandbox_tester
      TunesStubbing.itc_stub_candiate_builds
      TunesStubbing.itc_stub_pricing_tiers
      TunesStubbing.itc_stub_release_to_store
      TunesStubbing.itc_stub_promocodes
      TunesStubbing.itc_stub_generate_promocodes
      TunesStubbing.itc_stub_promocodes_history
      TunesStubbing.itc_stub_supported_countries
      TunesStubbing.itc_stub_iap
    end

    def unstub
      @cache_paths.each { |path| try_delete path }
    end

    private

    def try_delete(path)
      FileUtils.rm_f(path) if File.exist? path
    end
  end
end
