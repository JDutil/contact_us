require 'spec_helper'

describe 'Contact Us page' do

  after do
    ActionMailer::Base.deliveries = []
    ContactUs.form_gem = 'formtastic'
    ContactUs.mailer_from = nil
    ContactUs.mailer_to = nil
    ContactUs.require_name = false
    ContactUs.require_subject = false
  end

  before do
    ActionMailer::Base.deliveries = []
    ContactUs.mailer_to = 'test@test.com'
  end

  it 'displays default contact form properly' do
    visit contact_us_path
    within "form#new_contact_us_contact" do
      page.should have_selector "input#contact_us_contact_email"
      page.should have_selector "textarea#contact_us_contact_message"
      page.should_not have_selector "input#contact_us_contact_name"
      page.should_not have_selector "input#contact_us_contact_subject"
      page.should have_selector "input#contact_us_contact_submit"
    end
  end

  context "Submitting the form" do

    before do
      visit contact_us_path
    end

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
        mail.to.should == ['test@test.com']
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
          within '#contact_us_contact_email_input' do
            page.should have_content "is invalid"
          end
          within '#contact_us_contact_message_input' do
            page.should have_content "can't be blank"
          end
        end

        it "An email should not have been sent" do
          ActionMailer::Base.deliveries.size.should == 0
        end
      end
    end
  end

  context 'with name and subject configuration' do

    before do
      ContactUs.require_name = true
      ContactUs.require_subject = true
      visit contact_us_path
    end

    it "displays an input for name and subject" do
      page.should have_selector "input#contact_us_contact_name"
      page.should have_selector "input#contact_us_contact_subject"
    end

    context "Submitting the form" do
      context "when valid" do
        before do
          fill_in 'Email', :with => 'test@example.com'
          fill_in 'Message', :with => 'howdy'
          fill_in 'contact_us_contact[name]', :with => 'Jeff'
          fill_in 'contact_us_contact[subject]', :with => 'Testing contact form.'
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
          mail.body.should match 'howdy'
          mail.body.should match 'Jeff'
          mail.from.should == ['test@example.com']
          mail.subject.should match 'Testing contact form.'
          mail.to.should == ['test@test.com']
        end
      end

      context "when name and subject are blank" do
        before do
          click_button 'Submit'
        end

        it "I should see error messages" do
          within '#contact_us_contact_name_input' do
            page.should have_content "can't be blank"
          end
          within '#contact_us_contact_subject_input' do
            page.should have_content "can't be blank"
          end
        end

        it "An email should not have been sent" do
          ActionMailer::Base.deliveries.size.should == 0
        end
      end
    end
  end

end
