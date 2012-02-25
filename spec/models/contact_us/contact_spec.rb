require 'spec_helper'

describe ContactUs::Contact do
  it_should_behave_like 'ActiveModel'

  describe "Validations" do

    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:message)}
    it {should_not validate_presence_of(:name)}
    it {should_not validate_presence_of(:subject)}

    context 'with name and subject settings' do

      after do
        ContactUs.require_name = false
        ContactUs.require_subject = false
      end

      before do
        ContactUs.require_name = true
        ContactUs.require_subject =true
      end

      it {should validate_presence_of(:name)}
      it {should validate_presence_of(:subject)}

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
