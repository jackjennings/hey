$:.push File.expand_path("../lib", __FILE__)
require 'hey/version'

Gem::Specification.new do |s|
  s.name        = 'hey'
  s.version     = Hey::VERSION.dup
  s.authors     = ["Jack Jennings"]
  s.email       = 'j@ckjennin.gs'
  s.licenses    = ['MIT']
  s.summary     = "Sends a yo"
  s.description = "Sends a yo to your yo followers"
  s.homepage    = 'https://github.com/jackjennings/hey'
  s.files       = Dir["lib/**/*", "Rakefile", "README.md"]
  s.test_files  = Dir["test/**/*"]
  
  s.add_development_dependency "rake", "~>10.3"
  s.add_development_dependency "minitest", "~>5.3"
  s.add_development_dependency "webmock", "~>1.18"
  s.add_development_dependency "rdoc", "~>4.1"
end
