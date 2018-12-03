#
# Be sure to run `pod lib lint SMRefresh.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SMRefresh'
  s.version          = '0.1.0'
  s.summary          = '封装MJRefresh'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
封装MJRefresh 避免MJrRefresh api变动大规模修改业务代码
                       DESC

  s.homepage         = 'https://github.com/simon9211/SMRefresh'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'simon9211' => 'simon9211@126.com' }
  s.source           = { :git => 'https://github.com/simon9211/SMRefresh.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SMRefresh/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SMRefresh' => ['SMRefresh/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency "MJRefresh", "~> 3.1.15.7"

end
