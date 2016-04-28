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

`rails generate user_notif:install User`

The parameter `User` is the model name of my users (easy, no?).


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

### Views

To display your notifications, you can use some helpers:

`list_user_notifs(notifs, small = true)`

`user_notif(notif, small = true)`

```erb
<%= list_user_notifs(UserNotif.all) %>
<%= user_notif(UserNotif.last, false) %>
```

The `small` parameter will take care of rendering the partial located in `app/views/notifications/[small,full]`

### Mailer

 # TODO

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/terry90/user_notif. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).



[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/terry90/user_notif/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

