$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bigmouth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bigmouth"
  s.version     = Bigmouth::VERSION
  s.authors     = ["WAKASUGI 5T111111"]
  s.email       = ["baenej@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Bigmouth."
  s.description = "TODO: Description of Bigmouth."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "sqlite3"
end
