require 'rails/generators/base'

class UserNotif
  class UserNotifGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('templates', __FILE__)
    puts 'hello' ######################

    def copy_files
      copy_file 'notif.rb', "app/models/notifications/#{file_name}.rb"
    end
  end
end