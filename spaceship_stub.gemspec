Gem::Specification.new do |s|
  s.name        = 'spaceship_stub'
  s.version     = '0.0.4'
  s.date        = '2017-07-13'
  s.summary     = 'Rails gem for stubbing out Fastlane::Spaceship for writing specs'
  s.description = 'stubbing out Fastlane::Spaceship for writing specs'
  s.authors     = ['Minh Luong']
  s.email       = 'en14vn@gmail.com'
  s.files       = [
    'lib/spaceship_stub.rb',
    'lib/spaceship_stub/tunes_stubbing.rb',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/app_details.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/app_overview.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/app_overview_stuckinprepare.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/app_pricing_intervals.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/app_resolution_center.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/app_resolution_center_valid.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/app_submission',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/app_summary.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/app_version.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/app_version_ref.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/app_version_states_history.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/app_versions_history.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/availability/add_request.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/availability/add_response.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/availability/remove_request.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/availability/remove_response.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/availability/uninclude_all_future_territories_request.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/availability/uninclude_all_future_territories_response.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/build_details.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/build_history.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/build_history_for_train.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/build_trains.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/build_trains_operation_failed.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/candiate_builds.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/create_application_broken.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/create_application_first_broken.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/create_application_prefill_first_request.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/create_application_prefill_request.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/create_application_success.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/create_application_wildcard_broken.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/create_sandbox_tester.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/create_sandbox_tester_payload.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/create_version_success.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/delete_sandbox_tester.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/delete_sandbox_tester_payload.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/iap_consumable_template.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/iap_create.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/iap_detail.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/iap_families.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/iap_family_create.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/iap_family_create_success.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/iap_family_detail.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/iap_family_edit.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/iap_family_edit_versions.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/iap_family_template.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/iap_list.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/iap_price_goal_calc.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/iap_pricing_tiers.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/iap_update.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/invalid_login.html',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/landing_page.html',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/login_cntrl.js',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/login_cookie_spam.txt',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/member_create.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/member_create_appmanager_single_app.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/member_create_developer.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/member_list.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/member_template.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/pricing_tiers.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/promocodes.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/promocodes_generated.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/promocodes_history.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/ratings.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/ratings_US.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/reject_app_version_success.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/review_by_storefront.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/sandbox_testers.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/supported_countries.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/testers/create_tester.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/testers/existing_internal_testers.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/testers/get_external.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/testers/get_internal.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/testflight_build_info_appletvos.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/testflight_build_info_ios.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/testflight_submission_submit_appletvos.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/testflight_submission_submit_ios.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/update_app_version_failed.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/update_app_version_success.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/update_app_version_temporarily_unable.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/update_app_version_with_autorelease_overwrite_success.json',
    'lib/spaceship_stub/spaceship/spec/tunes/fixtures/user_detail.json',
    'lib/spaceship_stub/spaceship/spec/portal/app_group_spec.rb',
    'lib/spaceship_stub/spaceship/spec/portal/app_spec.rb',
    'lib/spaceship_stub/spaceship/spec/portal/certificate_spec.rb',
    'lib/spaceship_stub/spaceship/spec/portal/device_spec.rb',
    'lib/spaceship_stub/spaceship/spec/portal/enterprise_spec.rb',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/addAppId.action.apostroph.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/addAppId.action.explicit.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/addAppId.action.nopush.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/addAppId.action.wildcard.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/addApplicationGroup.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/addDeviceResponse.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/addDeviceResponse.action.plist',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/addWebsitePushId.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/aps_development.cer',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/certificateCreate.certRequest.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/certificateSigningRequest.certSigningRequest',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/create_profile_name_taken.txt',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/create_profile_success.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/deleteAppId.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/deleteApplicationGroup.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/deleteDevice.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/deleteProvisioningProfile.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/deleteWebsitePushId.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/dev_center_provisioning_profiles_response.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/download_certificate_failure.html',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/downloaded_provisioning_profile.mobileprovision',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/enableDevice.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/enterprise',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/getAppIdDetail.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/getProvisioningProfileAdHoc.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/getProvisioningProfileAppStore.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/getProvisioningProfileDevelopment.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/getProvisioningProfiletvOSAppStore.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/list_certificates_filtered.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/listApplicationGroups.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/listApps.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/listAppsMac.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/listCertRequests.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/listDevices.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/listDevicesDisabled.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/listDevicesiPhone.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/listDevicesiPod.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/listDevicesPage1-2.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/listDevicesPage2-2.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/listDevicesTV.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/listDevicesWatch.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/listProvisioningProfiles.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/listProvisioningProfiles.action.plist',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/listTeams_multiple.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/listTeams.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/listWebsitePushIds.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/peopleList.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/profileContentDownload.action',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/repair_profile_success.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/repair_profile_tvos_success.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/revokeCertificate.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/submitCertificateRequest.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/fixtures/updateAppIdName.action.json',
    'lib/spaceship_stub/spaceship/spec/portal/person_spec.rb',
    'lib/spaceship_stub/spaceship/spec/portal/persons_spec.rb',
    'lib/spaceship_stub/spaceship/spec/portal/portal_client_spec.rb',
    'lib/spaceship_stub/spaceship/spec/portal/portal_permission_spec.rb',
    'lib/spaceship_stub/spaceship/spec/portal/portal_stubbing.rb',
    'lib/spaceship_stub/spaceship/spec/portal/tvos_profile_spec.rb',
    'lib/spaceship_stub/spaceship/spec/portal/website_push_spec.rb',
  ]
  s.required_ruby_version = '~> 2.0'
  s.homepage    = 'https://github.com/luongm/spaceship_stub'
  s.license       = 'MIT'
end
