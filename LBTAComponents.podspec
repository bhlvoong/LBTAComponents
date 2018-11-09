#
# Be sure to run `pod lib lint LBTAComponents.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LBTAComponents'
  s.version          = '1.0.3'
  s.summary          = 'LBTAComponents is a small library of components that makes it easy to build applications programmatically.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'LBTAComponents is a small library of components that makes it easy to build applications programmatically.  One major component is the DatasourceController that allows developers to quickly construct a list view by plugging in a custom Datasource object. In addition, this pod includes helper methods that you can use to anchor views very easily without having to type too much.'

  s.homepage         = 'https://github.com/bhlvoong/LBTAComponents'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Brian Voong' => 'letsbuildthatapp@gmail.com' }
  s.source           = { :git => 'https://github.com/bhlvoong/LBTAComponents.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/buildthatapp'

  s.ios.deployment_target = '9.1'

  s.source_files = 'LBTAComponents/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LBTAComponents' => ['LBTAComponents/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
