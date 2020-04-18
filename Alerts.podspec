Pod::Spec.new do |s|
  s.name              = 'Alerts'
  s.version           = '2.0.0'
  s.license           = 'MIT'
  s.summary           = 'A μ-framework for abstracting modal contexts.'
  s.homepage          = 'https://github.com/DuetHealth/Alerts'
  s.author            = 'Duet Health'
  s.source            = { :git => 'git@github.com:DuetHealth/Alerts.git', :tag => s.version }
  s.requires_arc      = true
  s.ios.deployment_target = '8.0'
  s.swift_version         = '5.1'

  s.default_subspecs = 'Core', 'AlertsUI'

  s.subspec 'Core' do |sp|
    sp.name = 'Core'
    sp.source_files  = 'Alerts/Sources/**/*.{h,m,swift}'
  end

  s.subspec 'AlertsUI' do |sp|
    sp.name = 'AlertsUI'
    sp.source_files = 'AlertsUI/Sources/**/*.{h,m,swift}'
    sp.dependency 'Alerts/Core'
  end

end
