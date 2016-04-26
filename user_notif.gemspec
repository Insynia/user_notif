# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'user_notif/version'

Gem::Specification.new do |spec|
  spec.name          = 'user_notif'
  spec.version       = UserNotif::VERSION
  spec.authors       = ['Terry Raimondo']
  spec.email         = ['terry.raimondo@gmail.com']

  spec.summary       = %q{Notification system for your users.}
  spec.description   = %q{This gem adds notifications to your app, you can display the notifications where you want, add a dropdown on your header for example. Add views, mailer views and go !}
  spec.homepage      = 'https://github.com/terry90/user_notif'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_runtime_dependency 'activerecord', ['>= 4.0']
  spec.add_runtime_dependency 'actionmailer', ['>= 4.0']
  spec.add_runtime_dependency 'railties', ['>= 4.0']
  spec.add_runtime_dependency 'devise'
end
