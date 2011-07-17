require 'spec_helper'

describe ContactUs do

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

  describe 'mailer_to' do
    it 'should be configurable' do
      ContactUs.mailer_to = "contact@please-change-me.com"
      ContactUs.mailer_to.should eql("contact@please-change-me.com")
    end
  end

end
