# -*- encoding: utf-8 -*-
require File.expand_path('../lib/xmlsoccer/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kavinder Dhaliwal"]
  gem.email         = ["kavinderd@gmail.com"]
  gem.platform      = Gem::Platform::RUBY
  gem.description   = %q{Gem to interface with the xmlsoccer.com API}
  gem.summary       = %q{Gem to interface witht the xmlsoccer.com API}
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency "rake"
  gem.add_runtime_dependency "supermodel"
  gem.homepage      = ""
  
  gem.add_dependency "savon"
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "xmlsoccer"
  gem.require_paths = ["lib"]
  gem.version       = Xmlsoccer::VERSION
end
