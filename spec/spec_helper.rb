require File.dirname(__FILE__) + '/../lib/contact_us/tasks/install'

# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

unless defined?(Rubinius).present? or RUBY_VERSION == '1.8.7'
  require 'simplecov'
  SimpleCov.start do
    add_filter '/config/'
    add_group 'Controllers', 'app/controllers'
    add_group 'Helpers', 'app/helpers'
    add_group 'Mailers', 'app/mailers'
    add_group 'Models', 'app/models'
    add_group 'Libraries', 'lib'
    add_group 'Specs', 'spec'
  end
end

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"
require "rspec/rails"

ActionMailer::Base.delivery_method = :test
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.default_url_options[:host] = "test.com"

Rails.backtrace_cleaner.remove_silencers!

# Configure capybara for integration testing
require "capybara/rails"
Capybara.default_driver   = :rack_test
Capybara.default_selector = :css

# Run any available migration
ActiveRecord::Migrator.migrate File.expand_path("../dummy/db/migrate/", __FILE__)

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  # Remove this line if you don't want RSpec's should and should_not methods or matchers
  require 'rspec/expectations'
  config.include RSpec::Matchers

  # == Mock Framework
  config.mock_with :rspec
end
