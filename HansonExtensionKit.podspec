Pod::Spec.new do |s|
  s.name             = 'HansonExtensionKit'
  s.version          = '0.1.1'
  s.summary          = 'A collection of common extension functions in Swift.'
  s.homepage         = 'https://github.com/HansonStudio/HansonExtension'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zyphs21' => 'hansenhs21@live.com' }
  s.source           = { :git => 'https://github.com/HansonStudio/HansonExtension.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.swift_version    = '4.0'
  s.source_files     = 'HansonExtensionKit/Classes/**/*'
end
