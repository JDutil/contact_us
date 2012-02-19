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

  s.rubyforge_project = "contact_us"

  s.files         = Dir['Gemfile', 'MIT-LICENSE', 'README.md', 'Rakefile', 'app/**/*', 'config/**/*', 'lib/**/*']
  s.test_files    = Dir['spec/**/*']
  s.require_paths = ["lib"]

  s.add_development_dependency "capybara", "~> 1.1"
  s.add_development_dependency "rspec-rails", "~> 2.8"
  s.add_development_dependency "simplecov", "~> 0.5"
  s.add_development_dependency "sqlite3", "~> 1.3.5"

  s.add_runtime_dependency "formtastic", ">= 1.2.0"
  s.add_runtime_dependency "rails", ">= 3.0.0"
end
