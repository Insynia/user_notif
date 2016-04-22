require 'user_notif/version'
require 'user_notif/railtie' if defined?(Rails)

module UserNotif
  def self.setup
    yield self
  end

  mattr_accessor :mailer_sender
  @@mailer_sender = 'contact@myapp.com'

  mattr_accessor :app_name
  @@app_name = 'My App'
end
