#
#  Be sure to run `pod spec lint LJKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "LJKit"
  s.version      = "0.1.0"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.summary      = "A powerful iOS utility framework."
  s.homepage     = "https://github.com/lj20082/LJKit"
  s.author             = { "673637753@qq.com" => "673637753@qq.com" }
  s.social_media_url   = "http://muzijia.top/"
  s.platform     = :ios, "9.0"
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/lj20082/LJKit.git", :tag => s.version.to_s }
  s.requires_arc = true

  s.public_header_files = 'LJKit/LJKit.h'
  s.source_files = 'LJKit/LJKit.h'

  s.subspec 'Categorys' do |s1|
    s1.platform = :ios, "9.0"
    s1.ios.deployment_target = '9.0'
    s1.public_header_files = 'LJKit/Categorys/*.h'
    s1.source_files = 'LJKit/Categorys/*.{h,m}'
  end
  s.subspec 'Common' do |s2|
    s2.platform = :ios, "8=9.0"
    s2.ios.deployment_target = '9.0'
    s2.public_header_files = 'LJKit/Common/*.h'
    s2.source_files = 'LJKit/Common/*.{h,m}'
  end
  s.subspec 'Views' do |s3|
    s3.platform = :ios, "9.0"
    s3.ios.deployment_target = '9.0'
    s3.dependency 'LJKit/Categorys'
    s3.dependency 'LJKit/Common'
    s3.public_header_files = 'LJKit/Views/*.h'
    s3.source_files = 'LJKit/Views/*.{h,m}'
  end
  s.libraries = 'z'
  s.frameworks = 'UIKit', 'CoreFoundation' ,'QuartzCore', 'CoreGraphics', 'Accelerate'
end
