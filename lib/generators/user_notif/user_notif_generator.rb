require 'rails/generators/base'

class UserNotifGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  argument :target, type: :string

  def copy_files
    template 'notif.rb.erb', "app/models/notifications/#{file_name}_notif.rb"
    template 'notif_email.text.erb', "app/views/notifications/mailer/#{file_name}_notif.html.erb"
    template 'notif_email.text.erb', "app/views/notifications/mailer/#{file_name}_notif.text.erb"
  end
end