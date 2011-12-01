# Contact Us

A Rails 3+ Engine providing a basic contact form.  

[![Build Status](https://secure.travis-ci.org/jdutil/contact_us.png)](http://travis-ci.org/jdutil/contact_us)

There is also a demo application showing how the ContactUs form works:

* [View Demo Form In Action](http://contact-us-demo.heroku.com)
* [View Demo Applications Source Code](http://github.com/jdutil/contact_us_demo)

## REQUIREMENTS

Contact Us requires the Formtastic Gem.  Read more about Formtastic @ https://github.com/justinfrench/formtastic

I used Formtastic as a dependency to keep things simple, and hook into your apps custom Formtastic stylesheets.
People have different tastes for their html / css markup, and I find Formtastic to be a great standardized and reusable way to build forms across apps.

If you don't want to have Formtastic as a dependency there is a fork of this project without it [here](https://github.com/sch1zo/contact_us).

## INSTALLATION

In your `Gemfile`, add the following dependencies:

    gem 'contact_us', '~> 0.1.4'

From `Rails.root` run:

    $ bundle
    $ bundle exec rake contact_us:install

In `config/initializers/contact_us.rb` modify:

    config.mailer_to = "contact@please-change-me.com"

Change to the email address you would like to receive the form submissions at for example:

    config.mailer_to = "contact@yourdomain.com"

## CONFIGURATION

The generator copies the view files to `app/views/contact_us`, and you can customize them to suit your needs.

You may also update your locales under `config/locales/contact_us.en.yml` or create your own.  Please feel free to submit your own locales so that other users will hopefully find this gem more useful.

## USAGE

Visit your website and navigate to `/contact_us` to see the form in action.

## INTEGRATION TESTS

Contact Us has 100% test coverage, and provides simple integration specs you can drop directly into your apps test suite if you use RSpec & Capybara.

Simply copy the `spec/integration/contact_us_lint_spec.rb` file, and add it to your integration specs. 

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

* Add new language translations
* Make requested configurations in branches that users can reference in their Gemfile rather than the version.  This would allow for popular requests like adding a name, subject, or both to the form while also keeping the minimalist approach in master.

Copyright (c) 2011 Jeff Dutil, released under the [MIT license](https://github.com/jdutil/contact_us/tree/master/MIT-LICENSE).
