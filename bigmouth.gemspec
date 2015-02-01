$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bigmouth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bigmouth"
  s.version     = Bigmouth::VERSION
  s.authors     = ["WAKASUGI 5T111111"]
  s.email       = ["baenej@gmail.com"]
  s.homepage    = "https://github.com/5t111111"
  s.summary     = "Bigmouth is a mountable engine for creating simple blog pages for your application."
  s.description = "WORK IN PROGRESS: You should not use unless you are far too kind to contribute for the moment. Bigmouth is a mountable engine for creating simple blog pages for your application."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_dependency "slim-rails"
  s.add_dependency "tinymce-rails"
  s.add_dependency "truncate_html"

  s.add_dependency "bootstrap-sass", "~> 3.3.3"
  s.add_dependency "sass-rails", ">= 3.2"
  s.add_dependency "jquery-rails", ">= 4.0.3"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "sorcery"

  s.add_development_dependency "awesome_print"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "pry-doc"
  s.add_development_dependency "pry-stack_explorer"
  s.add_development_dependency "pry-byebug"
  s.add_development_dependency "better_errors"
  s.add_development_dependency "binding_of_caller"
  s.add_development_dependency "minitest-rails"
  s.add_development_dependency "minitest-rails-capybara"
  s.add_development_dependency "minitest-reporters"
  # s.add_development_dependency "minitest-power_assert"
  s.add_development_dependency "launchy"




end
