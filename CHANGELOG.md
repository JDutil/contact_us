## ContactUs 1.2.0 (Aug 8th 2016)

* Bump required Ruby to 2.2.2
* Add Arabic translation. [https://github.com/JDutil/contact_us/pull/59]
* Add optional I18n locale routing [https://github.com/JDutil/contact_us/pull/58]

## ContactUs 1.1.0 (May 1st 2015)

* Configurable mailer inheritance. [https://github.com/JDutil/contact_us/pull/53]

## ContactUs 1.0.1 (April 6th 2015)

* Add Traditional Chinese zh-TW translations. [yuchunc]

## ContactUs 1.0.0 (Jan 15th 2015)

* Fix Rails 4.2 deliver_later deprecation.
* Require Ruby 2+

## ContactUs 0.5.4 (Jun 25th 2014)

* Added Greek locale.

## ContactUs 0.5.3 (Jun 22nd 2014)

* Updated line specs to Rspec 3 expect syntax.

## ContactUs 0.5.1 (Nov 19th 2013)

* Require Rails >= 4 going forward. [Jeff Dutil]

## ContactUs 0.5.0 (Nov 19th 2013)

* Require Ruby >= 1.9.3 going forward. [Jeff Dutil]
* Updates for Rails 4 compatibility [flyerhzm]

## ContactUs 0.4.0 (Oct 29th 2012)

* Add default rails form helper support and remove Formtastic dependency. [Jeff Dutil]
* Added support for SimpleForm. [flyerhzm]
* Added Japanese locale. [yosiyuki]
* Added French locale. [bgantaume]
* No longer copy default views & locales during installation.  Copy manually with rake tasks when wanting to customize now. [Jeff Dutil]

## ContactUs 0.3.0 (May 15th 2012)

* Changed route to /contact-us from /contact_us for seo. [Jeff Dutil]

## ContactUs 0.2.1 (May 4th 2012)

* Use the users provided email address in the email notifications reply_to field. [Jeff Dutil]

## ContactUs 0.2.0 (February 25th 2012)

* Added ContactUs.mailer_from setting in order to send from verified address, which is better practice than pretending the email is from the user. [Jeff Dutil]
* Added ContactUs.require_name setting in order to ask for the name with the contact form. [Jeff Dutil]
* Added ContactUs.require_subject setting in order to for the subject with the contact form. [Jeff Dutil]
* Formtastic dependency updated to >= 2.1.0 in order to fix commit_button deprecation. [Jeff Dutil]

## ContactUs 0.1.5 (January 6th, 2012)

* Added Chinese zh locale [kinopyo]

## ContactUs 0.1.4 (September 26th, 2011)

* Added German locale
* Email subject is now included in i18n

## ContactUs 0.1.3 (September 2, 2011)

* Added Brazilian Portuguese locale [brunoarueira]
* Added Spanish locale [igmarin]
* Added Italian locale [igmarin]

## ContactUs 0.1.2 (August 18, 2011)

* 100% Test Coverage under Ruby 1.8.7, 1.9.2, 1.9.3, REE, ruby-head, rbx-2.0 [Jeff Dutil]
