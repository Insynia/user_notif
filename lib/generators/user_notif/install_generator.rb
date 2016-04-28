require 'rails/generators/active_record'

module UserNotif
  class InstallGenerator < ActiveRecord::Generators::Base
    desc 'This generator creates a migration file at db/migrate and an initializer'

    source_root File.expand_path('../install_templates', __FILE__)

    argument :name, type: :string, default: 'create_user_notif'

    def copy_files
      migration_template 'create_notifs.rb', 'db/migrate/create_notifs.rb'
      copy_file 'initializer.rb', 'config/initializers/user_notif.rb'
      copy_file 'notifications_controller.rb', 'app/controllers/notifications/notifications_controller.rb'
      copy_file 'locales/fr.yml', 'config/locales/user_notif.fr.yml'
      copy_file 'locales/en.yml', 'config/locales/user_notif.en.yml'
    end

    def add_user_notif_routes
      route "post '/notifications', to: 'user_notif/notifications#create'"
    end
  end
end