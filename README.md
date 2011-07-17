# Contact Us

A Rails 3 Engine providing a basic contact form.  I used Formtastic to keep things simple, and to hook into your apps custom Formtastic stylesheets.

[![Build Status](http://travis-ci.org/jdutil/contact_us.png)](http://travis-ci.org/jdutil/contact_us)

## REQUIREMENTS

Contact Us requires the Formtastic Gem.  Read more about Formtastic @ https://github.com/justinfrench/formtastic

## INSTALLATION

In your `Gemfile`, add the following dependencies:

    gem 'contact_us', '~> 0.0.7'

From `Rails.root` run:

    $ bundle
    $ rake contact_us:install

In `config/initializers/contact_us.rb` modify:

    config.mailer_to = "contact@please-change-me.com"

Change to the email address you would like to receive the form submissions at for example:

    config.mailer_to = "contact@yourdomain.com"

## CONFIGURATION

The generator copies the view files to `app/views/contact_us`, and you can customize them to suit your needs.

You may also update your locales under `config/locales/contact_us.en.yml` or create your own.  Please feel free to submit your own locales so that other users will hopefully find this gem more useful.

## USAGE

Visit your website and navigate to `/contact_us` to see the form in action.

## ISSUES

Please report any bugs or feature requests to the Github issues page @ https://github.com/jdutil/contact_us/issues

## CONTRIBUTING

In the spirit of [free software](http://www.fsf.org/licensing/essays/free-sw.html), **everyone** is encouraged to help improve this project.

Here are some ways *you* can contribute:

* by using prerelease versions
* by reporting bugs
* by suggesting new features
* by [translating to a new language](https://github.com/jdutil/contact_us/tree/master/config/locales)
* by writing or editing documentation
* by writing specifications
* by writing code (**no patch is too small**: fix typos, add comments, clean up inconsistent whitespace)
* by refactoring code
* by resolving [issues](https://github.com/jdutil/contact_us/issues)
* by reviewing patches

## TODO

* 100% test coverage
* Rails 3.1 Asset Pipeline

Copyright (c) 2011 Jeff Dutil, released under the [MIT license](https://github.com/jdutil/contact_us/tree/master/MIT-LICENSE).
