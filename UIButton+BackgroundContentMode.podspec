Pod::Spec.new do |s|
  s.name         = "UIButton+BackgroundContentMode"
  s.version      = "0.1.0"
  s.summary      = "A missing background content mode for UIButton."
  s.homepage     = "https://github.com/devxoul/UIButton-BackgroundContentMode"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "devxoul" => "devxoul@gmail.com" }
  s.source       = { :git => "https://github.com/devxoul/UIButton-BackgroundContentMode.git",
                     :tag => "#{s.version}" }
  s.platform     = :ios, '6.0'
  s.requires_arc = true
  s.source_files = 'UIButton+BackgroundContentMode/UIButton+BackgroundContentMode.{h,m}'
  s.frameworks   = 'Foundation', 'UIKit'
end
