# Contact Us

A Rails 3 Engine providing a basic contact form.  I used Formtastic to keep things simple, and to hook into your apps custom Formtastic stylesheets.

## REQUIREMENTS

Contact Us requires the Formtastic Gem.  Read more about Formtastic @ https://github.com/justinfrench/formtastic

## INSTALLATION

In your `Gemfile`, add the following dependencies:

    gem 'formtastic'
    gem 'contact_us', '~> 0.0.4'

From `Rails.root` run:

    $ bundle install
    $ rake contact_us:install

In `config/initializers/contact_us.rb` modify:

    config.mailer_to = "contact@please-change-me.com"

Change to the email address you would like to receive the form submissions at for example:

    config.mailer_to = "contact@yourdomain.com"

## CONFIGURATION

The generator copies the view files to `app/views/contact_us`, and you can customize them to suit your needs.

## TODO

* 100% test coverage
* i18n

Copyright (c) 2011 Jeff Dutil, released under the MIT license.
