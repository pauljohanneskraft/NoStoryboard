#
# Be sure to run `pod lib lint NoStoryboard.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NoStoryboard'
  s.version          = '1.0.1'
  s.summary          = 'NoStoryboard makes it easier to create UIKit-elements without storyboards.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Because UIKit is somewhat orientated towards programmers using Storyboards or at least .xib-files.
Programmatically creating views make sense, because of a more deterministic app behavior, less git merge issues, and many more reasons.
                       DESC

  s.homepage         = 'https://github.com/pauljohanneskraft/NoStoryboard'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Paul Kraft' => 'pauljohanneskraft@outlook.com' }
  s.source           = { :git => 'https://github.com/pauljohanneskraft/NoStoryboard.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.source_files = 'NoStoryboard/Classes/**/*'
  
  # s.resource_bundles = {
  #   'NoStoryboard' => ['NoStoryboard/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
