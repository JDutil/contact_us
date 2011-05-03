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
  s.summary     = %q{Gem providing simple Contact Us functionality with a Rails 3 Engine.}
  s.description = %q{A Rails 3 Engine providing a basic contact form.  I used Formtastic to keep things simple, and to hook into your apps custom Formtastic stylesheets.}

  s.rubyforge_project = "contact_us"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
