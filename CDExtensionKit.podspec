Pod::Spec.new do |s|
  s.name = 'CDExtensionKit'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'Basic toolset for CodoonSport.'
  s.homepage = 'https://github.com/iOSCodoon'
  s.authors = { 'iOSCodoon' => 'ios@codoon.com' }
  s.source = { :git => 'https://github.com/iOSCodoon/CDExtensionKit.git', :tag => s.version.to_s, :submodules => true }
  s.requires_arc = true
  s.ios.deployment_target = '8.0'

  s.public_header_files = 'CDExtensionKit/*.h'
  s.source_files = 'CDExtensionKit/*.{h,m}'

end
