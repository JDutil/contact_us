require File.expand_path('../../contact_us/tasks/install', __FILE__)

namespace :contact_us do
  desc "Install contact_us"
  task :install do
    ContactUs::Tasks::Install.run
  end

  desc "Copy only locale files (part of install, but useful for updates when only assets are needed)"
  task :copy_locales do
    ContactUs::Tasks::Install.copy_locales_files
  end

  desc "Copy only view files (part of install, but useful for updates when only assets are needed)"
  task :copy_views do
    ContactUs::Tasks::Install.copy_view_files
  end
end
