require 'action_mailer'

module UserNotif
  class NotifMailer < ActionMailer::Base
    def notif_email(notif_id)
      notif = Notif.find(notif_id)
      @target = notif.target
      @user = notif.user
      send_email({
                   to: @user.email,
                   template_path: 'notifications/mailer',
                   template_name: notif.template_name
                 }.merge(notif.email_options)
      )
    end

    private

    def send_email(opts)
      mail(opts)
    end
  end
end
