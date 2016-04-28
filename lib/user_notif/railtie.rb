require 'rails/railtie'

module UserNotif
  class Railtie < Rails::Railtie
    config.before_configuration do |app|
      ActiveSupport::Dependencies.autoload_paths += %W(#{app.root}/app/models/notifications)
    end

    initializer 'user_notif.view_helpers' do
      ActionView::Base.send :include, UserNotif::ViewHelpers
    end

    initializer :assets do
      Rails.application.config.assets.precompile += %w{ notifications.js.coffee notifications.scss }
      Rails.application.config.assets.paths << UserNotif.root + '/vendor/assets/javascripts'
      Rails.application.config.assets.paths << UserNotif.root + '/vendor/assets/stylesheets'
    end
  end
end
