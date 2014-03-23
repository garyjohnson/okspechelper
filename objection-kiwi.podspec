Pod::Spec.new do |s|

  s.name         = "objection-kiwi"
  s.version      = "0.1"
  s.summary      = "Simple helpers for using Objection framework with Kiwi tests"

  s.description  = <<-DESC
  Simple helpers for using Objection framework with Kiwi tests.
                   DESC

  s.homepage     = "https://github.com/garyjohnson/objection-kiwi"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "Gary Johnson" => "gary@gjtt.com" }
  s.social_media_url = "http://twitter.com/GaryGJohnson"

  s.platform     = :ios, '7.0'
  s.source       = { :git => "https://github.com/garyjohnson/objection-kiwi.git", :tag => "0.1" }

  s.source_files  = '*.{h,m}'
  s.public_header_files = '*.h'
  s.requires_arc = true

  s.framework = 'XCTest', 'Foundation'

  s.dependency 'Kiwi/XCTest'
  s.dependency 'Objection'

end
