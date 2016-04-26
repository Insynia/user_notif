# Combustion
require 'combustion'

Combustion.initialize! :all

# Coverage
require 'simplecov'
require 'coveralls'

SimpleCov.minimum_coverage 90
SimpleCov.minimum_coverage_by_file 80

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.at_exit do
  Dir.mkdir('coverage') unless Dir.exist?('coverage')
  SimpleCov.result.format!
end

SimpleCov.start

# Tests

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'user_notif'

ActionMailer::Base.delivery_method = :test
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.deliveries = []
