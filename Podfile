platform :ios, '12.0'
use_frameworks!
inhibit_all_warnings!

workspace 'MovieDBApp.xcworkspace'

def services
  pod 'Moya', '~> 13.0.1'
end

def common
  pod 'SwiftLint'
  pod 'RxSwift', '5.1.1'
  pod 'RxCocoa', '5.1.1'
end

def app
  pod 'Anchorage'
  pod 'Kingfisher'
  pod 'IQKeyboardManagerSwift', '6.4.0'
  # Development
  pod 'SwiftGen'
end

target 'MovieDBApp' do
  common
  app
  services
end


target 'MovieDBAppServices' do
  inherit! :search_paths
  project 'MovieDBAppServices/MovieDBAppServices.xcodeproj'
  common
  services
end

target 'MovieDBAppModels' do
  inherit! :search_paths
  project 'MovieDBAppModels/MovieDBAppModels.xcodeproj'
  common
end

post_install do |pi|
    pi.pods_project.targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '10'
      end
    end
end
