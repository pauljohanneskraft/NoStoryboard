#
# Be sure to run `pod lib lint NoStoryboard.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NoStoryboard'
  s.version          = '0.1.0'
  s.summary          = 'NoStoryboard makes it easy to create UIs programmatically (instead of Storyboards).'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Git issues with Storyboards are messy, that's why NoStoryboard aims for programmatically adding UI-Elements for iOS development instead of using Storyboards.
It also adds some syntactical sugar.
                       DESC

  s.homepage         = 'https://github.com/pauljohanneskraft/NoStoryboard'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'pauljohanneskraft' => 'paul.kraft@tum.de' }
  s.source           = { :git => 'https://github.com/pauljohanneskraft/NoStoryboard.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'NoStoryboard/Classes/**/*'
  
  # s.resource_bundles = {
  #   'NoStoryboard' => ['NoStoryboard/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
