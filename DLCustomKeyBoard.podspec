#
# Be sure to run `pod lib lint DLCustomKeyBoard.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DLCustomKeyBoard'
  s.version          = '0.1.0'
  s.summary          = 'a scrambled custom keyboard'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A fully customizable keyboard with cocoapods import support, including numeric and alphabetic keyboard with scrambled and sequential support'

  s.homepage         = 'https://github.com/alreadyRight/DLCustomKeyBoard'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '18358588190@163.com' => 'bingfeng.z@sunyard.com' }
  s.source           = { :git => 'https://github.com/alreadyRight/DLCustomKeyBoard.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'DLCustomKeyBoard/Classes/**/*'
  
   s.resource_bundles = {
     'DLCustomKeyBoard' => ['DLCustomKeyBoard/Assets/**/*.png']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
