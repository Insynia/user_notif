module UserNotif
  class Railtie < Rails::Railtie
    config.before_configuration do |app|
      ActiveSupport::Dependencies.autoload_paths += %W(#{app.root}/app/models/notifications)
    end
  end
end