$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'user_notif'
require 'coveralls'
require 'simplecov'

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.at_exit do
  Dir.mkdir('coverage') unless Dir.exist?('coverage')
  SimpleCov.result.format!
  SimpleCov.add_group 'Gem', 'lib'
end

SimpleCov.start

UserNotif.setup do |config|
  config.app_name = 'Test Application'
  config.mailer_sender = 'test@app.com'
end
