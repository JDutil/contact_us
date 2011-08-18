require 'spec_helper'

describe ContactUs::ContactMailer do

  describe "#contact_email" do

    before(:each) do
      ContactUs.mailer_to = "contact@please-change-me.com"
      @contact = ContactUs::Contact.new(:email => 'test@email.com', :message => 'Thanks!')
    end

    it "should render successfully" do
      lambda { ContactUs::ContactMailer.contact_email(@contact) }.should_not raise_error
    end

    describe "rendered without error" do

      before(:each) do
        @mailer = ContactUs::ContactMailer.contact_email(@contact)
      end

      it "should have the initializers to address" do
        @mailer.to.should eql([ContactUs.mailer_to])
      end

      it "should have users email in the from field" do
        @mailer.from.should eql([@contact.email])
      end

      it "should have the message in the body" do
        @mailer.body.should match("<p>Thanks!</p>")
      end

      it "should deliver successfully" do
        lambda { ContactUs::ContactMailer.contact_email(@contact).deliver }.should_not raise_error
      end

      describe "and delivered" do

        it "should be added to the delivery queue" do
          lambda { ContactUs::ContactMailer.contact_email(@contact).deliver }.should change(ActionMailer::Base.deliveries,:size).by(1)
        end

      end

    end

  end

end
