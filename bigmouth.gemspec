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

  s.add_dependency "slim-rails"
  s.add_dependency "tinymce-rails"

  s.add_dependency "bootstrap-sass", "~> 3.3.3"
  s.add_dependency "sass-rails", ">= 3.2"

  s.add_development_dependency "sqlite3"

  s.add_development_dependency "awesome_print"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "pry-doc"
  s.add_development_dependency "pry-stack_explorer"
  s.add_development_dependency "pry-byebug"
  s.add_development_dependency "better_errors"
  s.add_development_dependency "binding_of_caller"
  # s.add_development_dependency "minitest-rails-capybara"
  # s.add_development_dependency "minitest-reporters"
  # s.add_development_dependency "minitest-power_assert"
  # s.add_development_dependency "launchy"




end
