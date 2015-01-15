require 'spec_helper'

describe ContactUs::Contact do
  it_should_behave_like 'ActiveModel'

  describe "Validations" do

    it {is_expected.to validate_presence_of(:email)}
    it {is_expected.to validate_presence_of(:message)}
    it {is_expected.not_to validate_presence_of(:name)}
    it {is_expected.not_to validate_presence_of(:subject)}

    context 'with name and subject settings' do

      after do
        ContactUs.require_name = false
        ContactUs.require_subject = false
      end

      before do
        ContactUs.require_name = true
        ContactUs.require_subject =true
      end

      it {is_expected.to validate_presence_of(:name)}
      it {is_expected.to validate_presence_of(:subject)}

    end

  end

  describe 'Methods' do

    describe '#read_attribute_for_validation' do
      it 'should return attributes set during initialization' do
        contact = ContactUs::Contact.new(:email => "Valid@Email.com", :message => "Test")
        expect(contact.read_attribute_for_validation(:email)).to eql("Valid@Email.com")
        expect(contact.read_attribute_for_validation(:message)).to eql("Test")
      end
    end

    describe '#save' do

      it 'should return false if records invalid' do
        contact = ContactUs::Contact.new(:email => "Valid@Email.com", :message => "")
        expect(contact.save).to eql(false)
      end

      it 'should send email and return true if records valid' do
        mail = Mail.new(:from=>"Valid@Email.com", :to => "test@test.com")
        allow(mail).to receive(:deliver_now).and_return(true)
        contact = ContactUs::Contact.new(:email => "Valid@Email.com", :message => "Test")
        expect(ContactUs::ContactMailer).to receive(:contact_email).with(contact).and_return(mail)
        expect(contact.save).to eql(true)
      end

    end

    describe '#to_key' do
      it { expect(subject).to respond_to(:to_key) }
    end

  end

end
