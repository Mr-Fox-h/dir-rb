Gem::Specification.new do |s|
  s.name        = 'dir-rb'
  s.executables = ['dir-rb']
  s.version     = '0.1.0'
  s.executables = 'dir-rb'
  s.summary     = 'Scan websites with Ruby!'
  s.description = "The dir-rb command in Kali Linux is a web content scanner used for searching existing or hidden web objects on web servers."
  s.author      = 'Meisam Heidari'
  s.email       = 'mr.fox@iran.ir'
  s.files       = ['lib/dir-rb.rb', 'lib/scanner.rb']
  s.homepage    = 'https://github.com/Mr-Fox-h/dir-rb'
  s.add_runtime_dependency 'net-ping', '~> 2.0', '>= 2.0.8'
  s.add_runtime_dependency 'optparse', '~> 0.2.0'
  s.add_runtime_dependency 'colorize', '~> 0.8.1'
  s.add_runtime_dependency 'httparty', '~> 0.21.0'

  s.license = 'MIT'

  s.required_ruby_version     = '>= 2.7.0'
  s.required_rubygems_version = '>= 1.8.11'
end
