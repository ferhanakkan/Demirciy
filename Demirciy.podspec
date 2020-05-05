
Pod::Spec.new do |s|
  s.name             = 'Demirciy'
  s.version          = '0.3.0'
  s.summary          = 'A base framework is for iOS development.'

  s.description      = <<-DESC
  DemirciyFramework focuses the base of a development. Managers(Alert, Battery, Camera, Asset, Language, Keyboard, Loading, Location, Log, Service, UserDefaults),
  extensions, views.
                       DESC

  s.homepage         = 'https://github.com/demirciy/Demirciy'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yusuf Demirci' => 'demirciy94@gmail.com' }
  s.source           = { :git => 'https://github.com/demirciy/Demirciy.git', :tag => s.version.to_s }
  s.social_media_url = 'https://yusufdemirci.dev'

  s.ios.deployment_target = '11.0'
  s.swift_version = "5.0"

  s.source_files = 'Demirciy/Classes/**/*'
  s.resources = 'Demirciy/Resources/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'

  s.dependency 'Kingfisher', '5.13.4'
  s.dependency 'PromiseKit', '6.13.1'
  s.dependency 'PromiseKit/UIKit'
  s.dependency 'RxSwift', '5.1.1'
  s.dependency 'RxCocoa', '5.1.1'
  s.dependency 'RxAlamofire', '5.2.0'
  s.dependency 'RxDataSources', '4.0.1'
  s.dependency 'RxLocalizer', '1.5.0'
  s.dependency 'RxTheme', '4.0.0'
  s.dependency 'SnapKit', '5.0.1'
end
