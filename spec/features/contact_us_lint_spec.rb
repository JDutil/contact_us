require 'spec_helper'

describe 'Contact Us page', :type => :feature do

  after do
    ActionMailer::Base.deliveries = []
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
      expect(page).to have_selector "input#contact_us_contact_email"
      expect(page).to have_selector "textarea#contact_us_contact_message"
      expect(page).not_to have_selector "input#contact_us_contact_name"
      expect(page).not_to have_selector "input#contact_us_contact_subject"
      expect(page).to have_selector "input.submit"
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
        expect(current_path).to eq("/")
      end

      it "An email should have been sent" do
        expect(ActionMailer::Base.deliveries.size).to eq(1)
      end

      it "The email should have the correct attributes" do
        mail = ActionMailer::Base.deliveries.last
        expect(mail.to).to eq(['test@test.com'])
        expect(mail.from).to eq(['test@example.com'])
        expect(mail.body).to match 'howdy'
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
            expect(page).to have_content "is invalid"
          end
          within '#contact_us_contact_message_input' do
            expect(page).to have_content "can't be blank"
          end
        end

        it "An email should not have been sent" do
          expect(ActionMailer::Base.deliveries.size).to eq(0)
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
      expect(page).to have_selector "input#contact_us_contact_name"
      expect(page).to have_selector "input#contact_us_contact_subject"
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
          expect(current_path).to eq("/")
        end

        it "An email should have been sent" do
          expect(ActionMailer::Base.deliveries.size).to eq(1)
        end

        it "The email should have the correct attributes" do
          mail = ActionMailer::Base.deliveries.last
          expect(mail.body).to match 'howdy'
          expect(mail.body).to match 'Jeff'
          expect(mail.from).to eq(['test@example.com'])
          expect(mail.subject).to match 'Testing contact form.'
          expect(mail.to).to eq(['test@test.com'])
        end
      end

      context "when name and subject are blank" do
        before do
          click_button 'Submit'
        end

        it "I should see error messages" do
          within '#contact_us_contact_name_input' do
            expect(page).to have_content "can't be blank"
          end
          within '#contact_us_contact_subject_input' do
            expect(page).to have_content "can't be blank"
          end
        end

        it "An email should not have been sent" do
          expect(ActionMailer::Base.deliveries.size).to eq(0)
        end
      end
    end
  end

end
