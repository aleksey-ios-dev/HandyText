Pod::Spec.new do |s|

  s.name     = 'HandyText'
  s.version  = '1.3.1'
  s.ios.deployment_target = '9.0'
  s.license  = 'MIT'
  s.summary  = 'HandyText library helps you manage text styles in a declarative manner.'
  s.description = 'A tool providing a flexible and self descriptive wrapper for creating and managing attributed strings.'
  s.homepage = 'https://github.com/mmrmmlrr/TextStyle'
  s.author = { 'aleksey' => 'achernish85@gmail.com' }
  s.source   = { :git => 'https://github.com/mmrmmlrr/TextStyle.git', :tag => s.version.to_s }
  s.exclude_files = ["Demo/", "img/"]

  s.frameworks   = ['UIKit']
  s.source_files = '**/*.{m,h,mm,hpp,cpp,c,swift}'
  s.requires_arc = true

end
