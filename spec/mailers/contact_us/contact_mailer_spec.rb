require 'spec_helper'

describe ContactUs::ContactMailer do

  describe "#contact_email" do

    before do
      ContactUs.mailer_to = "contact@please-change-me.com"
      @contact = ContactUs::Contact.new(:email => 'test@email.com', :message => 'Thanks!')
    end

    it "should render successfully" do
      expect { ContactUs::ContactMailer.contact_email(@contact) }.not_to raise_error
    end

    it "should use the ContactUs.mailer_from setting when it is set" do
      ContactUs.mailer_from = "contact@please-change-me.com"
      @mailer = ContactUs::ContactMailer.contact_email(@contact)
      expect(@mailer.from).to eql([ContactUs.mailer_from])
      ContactUs.mailer_from = nil
    end

    describe "rendered without error" do

      before do
        @mailer = ContactUs::ContactMailer.contact_email(@contact)
      end

      it "should have the initializers to address" do
        expect(@mailer.to).to eql([ContactUs.mailer_to])
      end

      it "should use the users email in the from field when ContactUs.mailer_from is not set" do
        expect(@mailer.from).to eql([@contact.email])
      end

      it "should use the users email in the reply_to field" do
        expect(@mailer.reply_to).to eql([@contact.email])
      end

      it "should have users email in the subject line" do
        expect(@mailer.subject).to eql("Contact Us message from #{@contact.email}")
      end

      it "should have the message in the body" do
        expect(@mailer.body).to match("<p>Thanks!</p>")
      end

      it "should deliver successfully" do
        expect { ContactUs::ContactMailer.contact_email(@contact).deliver_now }.not_to raise_error
      end

      describe "and delivered" do

        it "should be added to the delivery queue" do
          expect { ContactUs::ContactMailer.contact_email(@contact).deliver_now }.to change(ActionMailer::Base.deliveries,:size).by(1)
        end

      end

    end

  end

end
