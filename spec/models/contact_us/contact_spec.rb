require 'spec_helper'

describe ContactUs::Contact do
  it_should_behave_like 'ActiveModel'

  describe "Validations" do

    it 'should validate email presence' do
      contact = ContactUs::Contact.new(:email => "", :message => "Test")
      contact.valid?.should eql(false)
      contact = ContactUs::Contact.new(:email => "Valid@Email.com", :message => "Test")
      contact.valid?.should eql(true)
    end

    it 'should validate email format' do
      contact = ContactUs::Contact.new(:email => "Invalid", :message => "Test")
      contact.valid?.should eql(false)
      contact = ContactUs::Contact.new(:email => "Valid@Email.com", :message => "Test")
      contact.valid?.should eql(true)
    end

    it 'should validate message presence' do
      contact = ContactUs::Contact.new(:email => "Valid@Email.com", :message => "")
      contact.valid?.should eql(false)
      contact = ContactUs::Contact.new(:email => "Valid@Email.com", :message => "Test")
      contact.valid?.should eql(true)
    end

  end

  describe 'Methods' do

    describe '#read_attribute_for_validation' do
      it 'should return attributes set during initialization' do
        contact = ContactUs::Contact.new(:email => "Valid@Email.com", :message => "Test")
        contact.read_attribute_for_validation(:email).should eql("Valid@Email.com")
        contact.read_attribute_for_validation(:message).should eql("Test")
      end
    end

    describe '#save' do

      it 'should return false if records invalid' do
        contact = ContactUs::Contact.new(:email => "Valid@Email.com", :message => "")
        contact.save.should eql(false)
      end

      it 'should send email and return true if records valid' do
        mail = Mail.new(:from=>"Valid@Email.com", :to => "test@test.com")
        mail.stub(:deliver).and_return(true)
        contact = ContactUs::Contact.new(:email => "Valid@Email.com", :message => "Test")
        ContactUs::ContactMailer.should_receive(:contact_email).with(contact).and_return(mail)
        contact.save.should eql(true)
      end

    end

    describe '#to_key' do
      it { subject.should respond_to(:to_key) }
    end

  end

end
