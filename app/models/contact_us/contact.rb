class ContactUs::Contact
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :email, :message, :name, :subject

  validates :email,   :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
                      :presence => true
  validates :message, :presence => true
  validates :name,    :presence => {:if => Proc.new{ContactUs.require_name}}
  validates :subject, :presence => {:if => Proc.new{ContactUs.require_subject}}

  def initialize(attributes = {})
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
  end

  def save
    if self.valid?
      ContactUs::ContactMailer.contact_email(self).deliver_now
      return true
    end
    return false
  end

  def persisted?
    false
  end

end
