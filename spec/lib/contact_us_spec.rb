require 'spec_helper'

describe ContactUs do

  after do
    ContactUs.mailer_from = nil
    ContactUs.mailer_to = nil
    ContactUs.require_name = false
    ContactUs.require_subject = false
    ContactUs.success_redirect = nil
  end

  it "should be valid" do
    expect(ContactUs).to be_a(Module)
  end

  describe 'setup block' do
    it 'should yield self' do
      ContactUs.setup do |config|
        expect(ContactUs).to eql(config)
      end
    end
  end

  describe 'mailer_from' do
    it 'should be configurable' do
      ContactUs.mailer_from = "contact@please-change-me.com"
      expect(ContactUs.mailer_from).to eql("contact@please-change-me.com")
    end
  end

  describe 'mailer_to' do
    it 'should be configurable' do
      ContactUs.mailer_to = "contact@please-change-me.com"
      expect(ContactUs.mailer_to).to eql("contact@please-change-me.com")
    end
  end

  describe 'require_name' do
    it 'should be configurable' do
      ContactUs.require_name = true
      expect(ContactUs.require_name).to eql(true)
    end
  end

  describe 'require_subject' do
    it 'should be configurable' do
      ContactUs.require_subject = true
      expect(ContactUs.require_subject).to eql(true)
    end
  end

end
