require 'spec_helper'

describe 'Contact Us page' do

  before do
    visit contact_us_path
  end

  it 'displays contact form' do
    page.should have_selector "form#new_contact_us_contact"
  end

  it "displays an input for email" do
    page.should have_selector "input#contact_us_contact_email"
  end

  it "displays a textarea for message" do
    page.should have_selector "textarea#contact_us_contact_message"
  end

  it "displays a submit button" do
    page.should have_selector "input#contact_us_contact_submit"
  end

  context "Submitting the form" do
    after { ActionMailer::Base.deliveries = [] }

    context "when valid" do
      before do
        fill_in 'Email', :with => 'test@example.com'
        fill_in 'Message', :with => 'howdy'
        click_button 'Submit'
      end

      it "I should be redirected to the homepage" do
        current_path.should == "/"
      end

      it "An email should have been sent" do
        ActionMailer::Base.deliveries.size.should == 1
      end

      it "The email should have the correct attributes" do
        mail = ActionMailer::Base.deliveries.last
        mail.to.should == [ContactUs.mailer_to]
        mail.from.should == ['test@example.com']
        mail.body.should match 'howdy'
      end
    end

    context "when invalid" do
      context "Email and message are invalid" do
        before do
          fill_in 'Email', :with => 'a'
          fill_in 'Message', :with => ''
          click_button 'Submit'
        end

        it "I should see two error messages" do
          page.should have_content "is invalid"
          page.should have_content "can't be blank"
        end

        it "An email should not have been sent" do
          ActionMailer::Base.deliveries.size.should == 0
        end
      end
    end
  end
end
