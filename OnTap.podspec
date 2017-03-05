Pod::Spec.new do |s|
  s.name             = 'OnTap'
  s.version          = '0.0.1'
  s.summary          = "Lovely, closure-based touch input handling for iOS."
  s.description      = <<-EOS
OnTap is an iOS library that provides a full input abstraction over all subclasses of UIControl, streamlines working with UIBarButtonItem, and also makes adding a UIGestureRecognizer a breeze. Essentially everything is now a button.
  EOS
  s.homepage         = 'https://github.com/skyefreeman/OnTap'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Skye Freeman' => 'skyefreeman@icloud.com' }
  s.source           = { :git => 'https://github.com/skyefreeman/OnTap.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ImSkyeFreeman'
  s.ios.deployment_target = '8.0'
  s.source_files = 'OnTap/Classes/**/*'
  s.frameworks = 'UIKit'
end
