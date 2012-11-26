require 'validates_email_format_of'

class ContactUs::Contact
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :email, :message, :name, :subject

  validates_email_format_of :email, :presence => true
  validates_presence_of :message
  validates_presence_of :name,    :if => Proc.new{ContactUs.require_name}
  validates_presence_of :subject, :if => Proc.new{ContactUs.require_subject}

  def initialize(attributes = {})
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
  end

  def save
    if self.valid?
      ContactUs::ContactMailer.contact_email(self).deliver
      return true
    end
    return false
  end
  
  def persisted?
    false
  end

  def self.add_attribute attr, validations
    attr_accessor attr
    validates attr, validations
  end
end
