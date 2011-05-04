module ContactUs
  require 'contact_us/engine'
  
  # Address to send ContactUs e-mails.
  mattr_accessor :mailer_to

  # Default way to setup ContactUs. Run rake contact_us:install to create
  # a fresh initializer with all configuration values.
  def self.setup
    yield self
  end

end
