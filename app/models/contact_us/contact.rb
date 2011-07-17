class ContactUs::Contact
  include ActiveModel::Validations

  validates :email, :presence => true,
                    :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  validates :message, :presence => true

  # to deal with form, you must have an id attribute
  attr_accessor :id, :email, :message

  def initialize(attributes = {})
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
    @attributes = attributes
  end

  def read_attribute_for_validation(key)
    @attributes[key]
  end

  def to_key; end

  def save
    if self.valid?
      ContactUs::ContactMailer.contact_email(self).deliver
      return true
    end
    return false
  end
end
