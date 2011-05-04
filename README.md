# Contact Us

A Rails 3 Engine providing a basic contact form.  I used Formtastic to keep things simple, and to hook into your apps custom Formtastic stylesheets.

## REQUIREMENTS

Contact Us requires the Formtastic Gem.  Read more about Formtastic @ https://github.com/justinfrench/formtastic

## INSTALLATION

In your `Gemfile`, add the following dependencies:

    gem 'formtastic'
    gem 'contact_us'

From `Rails.root` run:

    $ bundle install
    $ rake contact_us:install
    
Modify the installed initializer's mailer to settings to use your own email address.

## CONFIGURATION

The installation generator creates the `contact_us.rb` initializer within your apps `config/initializers` directory.

Modify the mailer to setting to be where you would like to send the contact form emails.

The generator has also copied the view files to `app/views/contact_us`, and you can customize them to suit your needs.

## TODO

* 100% test coverage
* i18n

Copyright (c) 2011 Jeff Dutil, released under the MIT license.
