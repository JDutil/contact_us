require 'rails/generators'

namespace :contact_us do
  desc "Install ContactUs"
  task :install do
    gem_path = __FILE__
    gem_path = gem_path.split("/")

    gem_path = gem_path[0..-4]
    gem_path = gem_path.join("/")

    Rails::Generators::Base.source_root(gem_path)
    copier = Rails::Generators::Base.new

    unless File.exists?(Rails.root.join("config/initializers/contact_us.rb"))
      print "Now copying initializer!\n"

      locales_path = gem_path + "/lib/templates/*"
      app_path = Rails.root.join("config/initializers")
      unless File.directory?(app_path)
        app_path.mkdir
      end
      Dir.glob(locales_path).each do |file|
        copier.copy_file file, File.join(app_path, File.basename(file))
      end
    end
    
    print "Now copying locales files!\n"

    locales_path = gem_path + "/config/locales/*.yml"
    app_path = Rails.root.join("config/locales")
    unless File.directory?(app_path)
      app_path.mkdir
    end
    Dir.glob(locales_path).each do |file|
      copier.copy_file file, File.join(app_path, File.basename(file))
    end

    print "Now copying view files for customization!\n"

    locales_path = gem_path + "/app/views/contact_us/contact_mailer/*"
    app_path = Rails.root.join("app/views/contact_us/contact_mailer")
    unless File.directory?(app_path)
      app_path.mkdir
    end
    Dir.glob(locales_path).each do |file|
      copier.copy_file file, File.join(app_path, File.basename(file))
    end
    
    locales_path = gem_path + "/app/views/contact_us/contacts/*"
    app_path = Rails.root.join("app/views/contact_us/contacts")
    unless File.directory?(app_path)
      app_path.mkdir
    end
    Dir.glob(locales_path).each do |file|
      copier.copy_file file, File.join(app_path, File.basename(file))
    end    
  end
end
