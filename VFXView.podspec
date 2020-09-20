#
#  Be sure to run `pod spec lint VFXView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name = "VFXView"
  spec.summary = "VFXView is a custom UIView with animation effect."
 
  spec.version = "0.1.0"


  spec.license = { :type => "MIT", :file => "LICENSE" }


  spec.author = { "Le Quang" => "levietquangt2@gmail.com" }


  spec.homepage = "https://github.com/lequangios/VFXView"


  spec.source = { :git => "https://github.com/lequangios/VFXView.git", 
               :tag => "#{spec.version}" }

  spec.ios.deployment_target = "10.0"
  spec.osx.deployment_target = "10.15"
  spec.requires_arc = true

  spec.framework = "UIKit"

  spec.source_files = "VFXView/**/*.{swift}"

  spec.resources = "VFXView/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"

  spec.swift_version = "5"

end
