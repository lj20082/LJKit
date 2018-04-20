#
#  Be sure to run `pod spec lint LJKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "LJKit"
  s.version      = "0.0.1"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.summary      = "A powerful iOS utility framework."
  s.homepage     = "https://github.com/lj20082/LJKit"
  s.author             = { "673637753@qq.com" => "673637753@qq.com" }
  s.social_media_url   = "http://muzijia.top/"
  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/lj20082/LJKit.git", :tag => s.version.to_s }
  s.requires_arc = true

  s.public_header_files = 'LJKit/LJKit.h'
  s.source_files = 'LJKit/LJKit.h'

  s.subspec 'Categorys' do |ss|
    s.platform     = :ios, "8.0"
    ss.ios.deployment_target = '8.0'
    ss.public_header_files = 'LJKit/Categorys/*.h'
    ss.source_files = 'LJKit/Categorys/*.{h,m}'
  end



  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
