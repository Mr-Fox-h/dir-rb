Gem::Specification.new do |s|
  s.name        = "dir-rb"
  s.version     = "0.0.1"
  s.summary     = "Web Content Scanner!"
  s.description = "Dir-rb is a Web Content Scanner mad with ruby language. It looks for existing (and/or hidden) Web Objects. It basically works by launching a dictionary based attack against a web server and analyzing the responses."
  s.authors     = ["Meisam Heidari"]
  s.email       = "mr.fox@iran.ir"
  s.files       = ["lib/dir-rb.rb"]
  s.homepage    = "nil"
  s.add_runtime_dependency 'net-ping', '~> 2.0', '>= 2.0.8'
  s.add_runtime_dependency 'optparse', '~> 0.2.0'
  s.add_runtime_dependency 'colorize', '~> 0.8.1'
  s.license       = "MIT"
  s.required_ruby_version     = '>= 2.7.0'
  s.required_rubygems_version = '>= 1.8.11'
end
