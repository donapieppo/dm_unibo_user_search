lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dm_unibo_user_search/version"

Gem::Specification.new do |gem|
  gem.name = "dm_unibo_user_search"
  gem.version = DmUniboUserSearch::VERSION
  gem.authors = ["Pietro Donatini"]
  gem.email = ["pietro.donatini@unibo.it"]
  gem.description = "Dm Unibo User Search interface"
  gem.summary = "Interface for Directory Service. Search and verify users."
  gem.homepage = "https://github.com/donapieppo/dm_unibo_user_search"
  gem.license = "MIT"

  gem.files = `git ls-files`.split($/)
  gem.executables = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.add_dependency "rails", "~> 7.0"
  gem.add_dependency "rack", "~> 3.1"
  gem.add_dependency "savon", "~> 2.15.0"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
end
