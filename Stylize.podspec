#
#  Be sure to run `pod spec lint stylize.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "Stylize"
  s.version      = "1.0.0"
  s.summary      = "Modern NSAttributedString"
  s.description  = <<-DESC
  A funcitonal wrapper of NSAttributedString for easy string styling
                   DESC
  s.homepage     = "https://github.com/alexfish/stylize"
  s.license      = "MIT"
  s.author             = { "alexfish" => "alex@alexefish.com" }
  s.source       = { :git => "https://github.com/alexfish/stylize.git", :tag => "#{s.version}" }
  s.source_files = 'Stylize/Stylize/Stylize.swift'
  s.ios.deployment_target = '8.0'
end
