require 'action_mailer'

module UserNotif
  class NotifMailer < ActionMailer::Base
    def notif_email(notif_id)
      notif = Notif.find(notif_id)
      @target = notif.target
      @user = notif.user
      mail(
          from: UserNotif.mailer_sender,
          to: @user.email,
          subject: notif.subject_email,
          template_path: 'notifications/mailer',
          template_name: notif.template_name
      )
    end
  end
end
