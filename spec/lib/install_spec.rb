require 'spec_helper'

describe "Rake tasks" do

  after(:each) do
    @destination_root = File.expand_path("../../dummy", __FILE__)
    FileUtils.rm_rf(@destination_root + "/config/initializers/contact_us.rb")
    FileUtils.rm_rf(@destination_root + "/config/locales/contact_us.en.yml")
    FileUtils.rm_rf(@destination_root + "/app/views/contact_us")
    FileUtils.rm_rf(@destination_root + "/app/views/contact_us/contact_mailer")
    FileUtils.rm_rf(@destination_root + "/app/views/contact_us/contacts")
  end

  before(:each) do
    @destination_root = File.expand_path("../../dummy", __FILE__)
    File.exists?(@destination_root + "/config/initializers/contact_us.rb").should eql(false)
    File.exists?(@destination_root + "/config/locales/contact_us.en.yml").should eql(false)
    File.directory?(@destination_root + "/app/views/contact_us").should eql(false)
    File.directory?(@destination_root + "/app/views/contact_us/contact_mailer").should eql(false)
    File.directory?(@destination_root + "/app/views/contact_us/contacts").should eql(false)
  end

  describe "contact_us:install" do

    before do
      ContactUs::Tasks::Install.run
    end

    it "creates initializer file" do
      File.exists?(File.join(@destination_root + "/config/initializers/contact_us.rb")).should eql(true)
    end

  end

  describe 'contact_us:copy_locales' do
    before do
      ContactUs::Tasks::Install.copy_locales_files
    end

    it "creates locales files" do
      File.exists?(File.join(@destination_root + "/config/locales/contact_us.en.yml")).should eql(true)
    end
  end

  describe "contact_us:install" do

    before do
      ContactUs::Tasks::Install.copy_view_files
    end

    it "creates view files" do
      File.directory?(@destination_root + "/app/views/contact_us").should eql(true)
      File.directory?(@destination_root + "/app/views/contact_us/contact_mailer").should eql(true)
      File.directory?(@destination_root + "/app/views/contact_us/contacts").should eql(true)
    end

  end

end
