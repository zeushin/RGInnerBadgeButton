#
# Be sure to run `pod lib lint RGInnerBadgeButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RGInnerBadgeButton'
  s.version          = '0.1.0'
  s.summary          = 'Inner Badge Button with IBDesignable.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Inner Badge Button with IBDesignable. Enjoy it!
                       DESC

  s.homepage         = 'https://github.com/zeushin/RGInnerBadgeButton'
  s.screenshots      = 'https://raw.githubusercontent.com/beomcheol/RGInnerBadgeButton/0.1.0/Screenshots/Screen%20Shot%202017-01-12%20at%2010.46.04%20AM.png', 'https://raw.githubusercontent.com/beomcheol/RGInnerBadgeButton/0.1.0/Screenshots/Simulator%20Screen%20Shot%2012%20Jan%202017%2C%2010.47.01%20AM.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Masher Shin' => 'zeushin@gmail.com' }
  s.source           = { :git => 'https://github.com/zeushin/RGInnerBadgeButton.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/masher_s'

  s.ios.deployment_target = '8.0'

  s.source_files = 'RGInnerBadgeButton/Classes/**/*'
  
  # s.resource_bundles = {
  #   'RGInnerBadgeButton' => ['RGInnerBadgeButton/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
