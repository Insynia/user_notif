$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'user_notif'
#require 'coveralls'
#Coveralls.wear!

if ENV.fetch('COVERAGE', false)
  require 'simplecov'
  SimpleCov.at_exit do
    Dir.mkdir('coverage') unless Dir.exist?('coverage')
    SimpleCov.result.format!
    SimpleCov.add_group 'Gem', 'lib'
  end
  SimpleCov.start
end

UserNotif.setup do |config|
  config.app_name = 'Test Application'
  config.mailer_sender = 'test@app.com'
end