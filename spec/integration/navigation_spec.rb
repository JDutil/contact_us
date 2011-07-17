require 'spec_helper'

describe "Navigation" do
  include Capybara

  it "should be a valid app" do
    ::Rails.application.should be_a(Dummy::Application)
  end

  describe "Sending a contact email" do
    context "I'm on the contact page" do
      before { visit new_contact_url }

      it "I should see an input for email" do
        page.should have_selector "input#contact_us_contact_email"
      end

      it "I should see a textarea for message" do
        page.should have_selector "textarea#contact_us_contact_message"
      end

      it "I should see a submit button" do
        page.should have_selector "input#contact_us_contact_submit"
      end

      context "Submitting a form" do
        after { ActionMailer::Base.deliveries = [] }

        context "Submitting a valid form" do
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

        context "Submitting an invalid form" do
          context "Email and message are invalid" do
            before do
              fill_in 'Email', :with => 'a'
              fill_in 'Message', :with => ''
              click_button 'Submit'
            end

            it "I should see two error messages" do
              page.should have_content 'is invalid'
              page.should have_content "can't be blank"
            end
            
            it "An email should not have been sent" do
              ActionMailer::Base.deliveries.size.should == 0
            end
          end
        end
      end
    end
  end

end
