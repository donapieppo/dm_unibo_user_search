# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dm_unibo_user_search/version'

Gem::Specification.new do |gem|
  gem.name          = "dm_unibo_user_search"
  gem.version       = DmUniboUserSearch::VERSION
  gem.authors       = ["Pietro Donatini"]
  gem.email         = ["pietro.donatini@unibo.it"]
  gem.description   = %q{Dm Unibo User Search interface}
  gem.summary       = %q{Interface for Directory Service. Search and verify users.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "savon"

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
end
