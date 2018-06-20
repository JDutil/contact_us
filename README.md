# Contact Us [![Build Status](https://secure.travis-ci.org/JDutil/contact_us.png)](http://travis-ci.org/JDutil/contact_us)

A Rails 3+ Engine providing a basic contact form.

[travis]: http://travis-ci.org/jdutil/contact_us

There is also a demo application showing how the ContactUs form works:

* [View Demo Form In Action](http://contact-us-demo.herokuapp.com)
* [View Demo Applications Source Code](http://github.com/jdutil/contact_us_demo)

## REQUIREMENTS

Contact Us requires:

* Ruby >= 1.9.3
* Rails >= 3.0.0

It is also recommended to use Formtastic or SimpleForm (see configuration) in order to hook into your apps custom form builders.

## INSTALLATION

In your `Gemfile`, add the following dependencies:

```ruby
gem 'contact_us', '~> 1.0.1'
```

From `Rails.root` in your Terminal run:

```shell
bundle
bundle exec rake contact_us:install
```

In `config/initializers/contact_us.rb` modify:

```ruby
config.mailer_to = "contact@please-change-me.com"
```

Change to the email address you would like to receive the form submissions at for example:

```ruby
config.mailer_to = "contact@yourdomain.com"
```

By default the emails from field will be the email entered by the user to easily reply, but this may not be allowed if your required to verify your sending email addresses.
You may also specify an email address for the notification emails from field:

```ruby
config.mailer_from = "dontreply@yourdomain.com"
```

## CONFIGURATION

If you would like to add a name or subject field to the form you may simply
set the options to true within the contact_us initializer located at `config/initializers/contact_us.rb`:

```ruby
config.require_name = true
config.require_subject = true
```

To redirect to a specific URL after a successful form submission:

```ruby
config.success_redirect = '/contact-success'
```

If you're using I18n localization and would like to have the locale be a part of your paths
For example: /en/contact-us OR /fr/contact-us OR /en-UK/contact-us

```ruby
config.localize_routes = true
```

### Views

To copy the view files to `app/views/contact_us`, and customize them to suit your needs run:

```shell
bundle exec rake contact_us:copy_views
```

### Locales

To copy the locale files to `config/locales/contact_us.*.yml`, and customize them to suit your needs run:

```shell
bundle exec rake contact_us:copy_locales
```

Please feel free to submit your own locales so that other users will hopefully find this gem more useful in your language.

If you would like to include the locale in your paths (e.g. /en/contact-us), set the localize_routes
parameter to true in your initializer (see the configuration section above)

### Formtastic

In order to use a Formtastic compatible template to hook into your custom form styles configure `config/initializers/contact_us.rb`:

```ruby
config.form_gem = 'formtastic'
```

* By default the HTML should match that produced by Formtastic, but to ensure it is up to date you should set Formtastic.

### SimpleForm

In order to use a SimpleForm compatible template to hook into your custom form styles configure `config/initializers/contact_us.rb`:

```ruby
config.form_gem = 'simple_form'
```

## UPGRADING

When upgrading from 0.1.x to 0.2.x you should rerun the install generator to install the new settings, views, and locale updates:

```shell
bundle exec rake contact_us:install
```

Or you may run the generators for each specific component you would like to update, which is quite useful when upgrading during patch releases for example from 0.2.0 to 0.2.1:

```shell
bundle exec rake contact_us:copy_locales
bundle exec rake contact_us:copy_views
```

## USAGE

Visit your website and navigate to `/contact-us` to see the form in action.

## INTEGRATION TESTS

Contact Us has 100% test coverage, and provides simple integration specs you can drop directly into your apps test suite if you use RSpec & Capybara.

Simply copy the `spec/integration/contact_us_lint_spec.rb` file, and add it to your integration specs.

## ISSUES

Please report any bugs or feature requests to the Github issues page @ https://github.com/jdutil/contact_us/issues

## TESTING

In order to run the spec suite:

```shell
bundle exec rspec spec
```

## TODO

* Add new language translations.

## CONTRIBUTING

In the spirit of [free software](http://www.fsf.org/licensing/essays/free-sw.html), **everyone** is encouraged to help improve this project.

Here are some ways _you_ can contribute:

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

## Donating

Bitcoin donations may be sent to: 1Jz1rWG6HSWb6eBGgTyhANrkVxmzY4YPKS

Copyright (c) 2011-2013 Jeff Dutil, released under the [MIT license](https://github.com/jdutil/contact_us/tree/master/MIT-LICENSE).
