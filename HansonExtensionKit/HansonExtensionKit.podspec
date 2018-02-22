Pod::Spec.new do |s|
  s.name                = "HansonExtensionKit"
  s.version             = "0.1.0"
  s.summary             = "A collection of common extension functions in Swift."
  s.description         = "The HansonExtensionKit is a collection of common extension functions in Swift."
  s.homepage            = "https://github.com/HansonStudio/HansonExtension"
  s.license             = "MIT"
  s.license             = { :type => "MIT", :file => "LICENSE" }
  s.author              = { "Hanson" => "hansenhs21@live.com" }
  s.platform            = :ios, "9.0"
  s.source              = { :git => "https://github.com/HansonStudio/HansonExtension.git", :tag => "#{s.version}" }
  # s.source_files        = "HansonExtensionKit", "HansonExtensionKit/**/*"
  s.source_files        = '**/*.{h,swift}'
  s.swift_version       = '4.0'
  s.preserve_paths      = 'CommonCrypto/module.map'

end
