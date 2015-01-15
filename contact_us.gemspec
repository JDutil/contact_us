# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "contact_us/version"

Gem::Specification.new do |s|
  s.name        = "contact_us"
  s.version     = ContactUs::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jeff Dutil"]
  s.email       = ["JDutil@BurlingtonWebApps.com"]
  s.homepage    = "https://github.com/jdutil/contact_us"
  s.summary     = %q{Gem providing simple Contact Us functionality with a Rails 3+ Engine.}
  s.description = %q{A Rails 3+ Engine providing a basic contact form.  I used Formtastic to keep things simple, and to hook into your apps custom Formtastic stylesheets.}

  s.required_ruby_version = '>= 2.0.0'
  s.rubyforge_project = "contact_us"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_development_dependency "capybara",         "~> 2.0"
  s.add_development_dependency "rspec-rails",      "~> 3.1"
  s.add_development_dependency "shoulda-matchers", ">= 1.5.4"
  s.add_development_dependency "simplecov",        "~> 0.7"
  s.add_development_dependency "sqlite3",          "~> 1.3.5"
  s.add_development_dependency "formtastic",       ">= 2.1.0"
  s.add_development_dependency "simple_form"

  s.add_runtime_dependency "rails", ">= 4.2.0"
end
