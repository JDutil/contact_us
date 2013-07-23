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
    ContactUs.should be_a(Module)
  end

  describe 'setup block' do
    it 'should yield self' do
      ContactUs.setup do |config|
        ContactUs.should eql(config)
      end
    end
  end

  describe 'mailer_from' do
    it 'should be configurable' do
      ContactUs.mailer_from = "contact@please-change-me.com"
      ContactUs.mailer_from.should eql("contact@please-change-me.com")
    end
  end

  describe 'mailer_to' do
    it 'should be configurable' do
      ContactUs.mailer_to = "contact@please-change-me.com"
      ContactUs.mailer_to.should eql("contact@please-change-me.com")
    end
  end

  describe 'require_name' do
    it 'should be configurable' do
      ContactUs.require_name = true
      ContactUs.require_name.should eql(true)
    end
  end

  describe 'require_subject' do
    it 'should be configurable' do
      ContactUs.require_subject = true
      ContactUs.require_subject.should eql(true)
    end
  end

end
