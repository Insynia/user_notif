UserNotif.setup do |config|
  config.app_name = 'My App'
  config.mailer_sender = 'contact@myapp.com'
  config.mailer_bcc = 'log@myapp.com'
  config.mailer_return_path = 'contact2@myapp.com'
end
