# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'
inhibit_all_warnings!
use_modular_headers!
install! 'cocoapods', :warn_for_unused_master_specs_repo => false

def pods
  pod 'SnapKit'
  pod 'Alamofire'
  pod 'ObjectMapper'
  # pod 'AlamofireObjectMapper'
  pod 'Ji'
  pod 'DrawerController'
  pod 'Kingfisher'
  pod 'KeychainSwift'
  pod 'KVOController'
  pod 'YYText'
  pod 'FXBlurView'
  pod 'SVProgressHUD'
  pod 'MJRefresh'
  pod 'CXSwipeGestureRecognizer'
  pod '1PasswordExtension'
  pod 'Shimmer'
  pod 'FDFullscreenPopGesture'
  pod 'Moya/RxSwift'
  pod 'SwiftyJSON'
  
end

target 'V2Demo' do
  # Comment the next line if you don't want to use dynamic frameworks

  # Pods for V2Demo
  pods
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      # 将三方库的 Depoly 版本号都提到 iOS11，隐藏编译过程中相关的 Deprecated 警告及其他警告
      target.build_configurations.each do |config|
        config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = 'YES'
        if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 11.0
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
        end
      end
      if target.name == 'Ji' or target.name == 'Moya'  or target.name == 'Result'
        target.build_configurations.each do |config|
          config.build_settings['SWIFT_VERSION'] = '4.2'
        end
      end
      if target.name == 'DrawerController'
        target.build_configurations.each do |config|
          config.build_settings['SWIFT_VERSION'] = '4.0'
        end
      end
    end
  end


  target 'V2DemoTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'V2DemoUITests' do
    # Pods for testing
  end

end