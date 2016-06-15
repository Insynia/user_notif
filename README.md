# UserNotif

[![Gem Version](https://badge.fury.io/rb/user_notif.svg)](https://badge.fury.io/rb/user_notif)
[![Build Status](https://travis-ci.org/terry90/user_notif.svg?branch=master)](https://travis-ci.org/terry90/user_notif)
[![Coverage Status](https://coveralls.io/repos/github/terry90/user_notif/badge.svg?branch=master)](https://coveralls.io/github/terry90/user_notif?branch=master)
[![Code Climate](https://codeclimate.com/github/terry90/user_notif/badges/gpa.svg)](https://codeclimate.com/github/terry90/user_notif)
[![Dependency Status](https://gemnasium.com/badges/github.com/terry90/user_notif.svg)](https://gemnasium.com/github.com/terry90/user_notif)
[![security](https://hakiri.io/github/terry90/user_notif/master.svg)](https://hakiri.io/github/terry90/user_notif/master)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'user_notif'
```

And then execute:

    $ bundle


---


After you install UserNotif and add it to your Gemfile, you need to run the generator:

`rails generate user_notif:install`

The UserNotifs belong to a user. To ensure it works, make sure you have a `User` model


---


If you want to use it out of the box, require JS and SCSS files

In your `app/assets/stylesheets/application.css`

```css
/*
 *= require user_notif
 */
```

In your `app/assets/javascripts/application.js`

```js
//
//= require user_notif
//
```

## Usage

Now you can create your first notification !

### Models

Run this generator:

`rails generate user_notif name target_model`

It will create a `NameNotif` model and his associated views. You should customize the generated views.

A notification has a user and a target. The target can be any model, like a `User` or something else.
You can then override the views to display informations about the target.

Example:

`rails generate user_notif new_follower user`

It creates a NewFollowerNotif

Now you can add the logic to create notifications when a user is followed by another one (the target).

Example:

`NewProjectNotif.create(target: self, user: self.user)`

To create sticky notifs (notification staying on top of the list), you can add `sticky: true` when you create it. Like this:

`NewProjectNotif.create(target: self, user: self.user, sticky: true)`

Then, you can display it in your view like this: `<%= list_user_notifs(UserNotif::Notif.all.order(sticky: :desc, unread: desc, id: :desc)) %>`
This line of code will display notifications by sticky first, then unread, then by id.

### Views

To display your notifications, you can use some helpers:

`list_user_notifs(notifs, small = true)`

`user_notif(notif, small = true)`

```erb
<%= list_user_notifs(UserNotif.all) %>
<%= user_notif(UserNotif.last, false) %>
```

The `small` parameter will take care of rendering the partial located in `app/views/notifs/[small,full]`


#### Cutomizing your views

You can customize your views by modifying `app/views/notifs/[small,full]/*` files.

Implement your own element to mark notifications as read with `mark-as-read` class.

An ajax call to the `data-url` is triggered when you click on this element. This makes the notification read !

Example:

```erb
<div class=user-notif">
  ...
  <div class="mark-as-read" data-url="<%= read_user_notif_path(id: @notif.id) %>">X</div>
</div>
```

The default behavior remove the unread class on the element itself but you can override it or add your own behavior.

### Mailer

Every notification sends a mail by default.
You can override this in your generated model: `app/models/notifs/your_notif.rb`

The mailer views are located at `app/views/notifs/mailer/your_notif.[html,text].erb`

You can customize the mailer by providing options in your generated initializer (install step):

```ruby
# config/initializers/user_notif.rb

UserNotif.setup do |config|
  config.app_name = 'My App'
  config.mailer_sender = 'no-reply@myapp.com'
  config.mailer_bcc = 'admin@myapp.com'
  config.mailer_cc = 'admin@myapp.com'
  config.mailer_reply_to = 'admin@myapp.com'
  config.mailer_date = Date.current
  config.return_path = 'contact@myapp.com'
end
```

By modifying the initializer, all your notification mailers will default to this.
You can still provide custom values per notification by overriding the method `email_options` in your generated model.

This method should look like this:

```ruby
# app/models/notifs/your_notif.rb
...
def email_options
  super({
      subject: I18n.t('awesome.18n.key'),
      cc: @coworker.email,
      bcc: @president.email
    })
end
```

The `super` ensures default values are loaded.

If you want to customize the mailer behaviour, you can re-open the class at `app/mailers/user_notif/notif_mailer.rb`. For example, If you want to use another mail generator (such as Roadie) alongs with i18n and the Rails URL helpers or even add a layout to your emails, it would give something like this :

```ruby
# app/mailers/user_notif/notif_mailer.rb

class UserNotif::NotifMailer
  include Roadie::Rails::Automatic
  include DefaultUrlOptions
  include Rails.application.routes.url_helpers

  layout 'mailer'
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/terry90/user_notif. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

