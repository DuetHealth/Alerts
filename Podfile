source 'git@gitlab.duethealth.com:ios-projects/duet-health-cocoapod-specs.git'
source 'https://github.com/CocoaPods/Specs.git'

project 'Alerts.xcodeproj'
platform:ios, '9.0'
inhibit_all_warnings!
use_frameworks!

target 'Alerts' do
  podspec name: 'Alerts'

  target 'AlertsTests' do
    inherit! :search_paths
    pod 'Nimble'
    pod 'Quick'
  end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'NO'
      config.build_settings['SWIFT_VERSION'] = '3.2'
    end
  end
end

