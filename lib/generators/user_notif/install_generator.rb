require 'rails/generators/active_record'

module UserNotif
  class InstallGenerator < ActiveRecord::Generators::Base
    desc 'This generator creates a migration file at db/migrate'

    argument :name, type: :string, default: 'create_user_notif'

    source_root File.expand_path('../install', __FILE__)

    def copy_files
      migration_template 'create_user_notif.rb', 'db/migrate/create_user_notif.rb'
    end
  end
end