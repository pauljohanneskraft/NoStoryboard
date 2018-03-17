
Pod::Spec.new do |s|
  s.name             = 'NoStoryboard'
  s.version          = '1.0.4'
  s.summary          = 'NoStoryboard makes it easier to create UIKit-elements without storyboards.'

  s.description      = <<-DESC
Because UIKit is somewhat orientated towards programmers using Storyboards or at least .xib-files.
Programmatically creating views make sense, because of a more deterministic app behavior, less git merge issues, and many more reasons.
                       DESC

  s.documentation_url = 'https://pauljohanneskraft.github.io/NoStoryboard/'
  s.homepage         = 'https://github.com/pauljohanneskraft/NoStoryboard'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Paul Kraft' => 'pauljohanneskraft@icloud.com' }
  s.source           = { :git => 'https://github.com/pauljohanneskraft/NoStoryboard.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.source_files = 'NoStoryboard/Classes/**/*'
  
  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
