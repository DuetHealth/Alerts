Pod::Spec.new do |s|
  s.name              = 'Alerts'
  s.version           = '2.0.0'
  s.license           = 'MIT'
  s.summary           = 'A μ-framework for abstracting modal contexts.'
  s.homepage          = 'http://gitlab.duethealth.com/groups/ios-projects/Alerts'
  s.author            = 'Duet Health'
  s.source            = { :git => 'git@gitlab.duethealth.com:ios-projects/Alerts.git', :tag => s.version }
  s.ios.source_files  = 'Alerts/Sources/**/*.{h,m,swift}'
  s.requires_arc      = true
  s.xcconfig          = {'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'}
  s.ios.deployment_target = '8.0'
  s.swift_version         = '4.0'
end
