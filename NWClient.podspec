Pod::Spec.new do |s|
  
  s.name                   = 'NWClient'
  s.module_name            = 'NWClient'
  s.summary                = 'NWClient'
  s.description            = 'NWClient'
  s.version                = '1.0.0'

  s.homepage               = 'https://github.com/AlexanderKadyrov/NWClient'
  s.author                 = { 'Alexander Kadyrov' => 'alexander-kad@yandex.ru' }
  s.source                 = { :git => 'git@github.com:AlexanderKadyrov/NWClient.git', :tag => s.version.to_s }
  
  s.source_files           = 'NWClient/Sources/**/*.{h,swift}'

  s.tvos.deployment_target = '9.0'
  s.ios.deployment_target  = '9.0'
  s.swift_version          = '5.0'

  s.license                = { :type => 'MIT', :file => 'LICENSE.md' }
  
  s.dependency 'ReactiveSwift'
  s.dependency 'Alamofire'

  s.requires_arc = true

end