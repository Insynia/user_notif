require 'action_mailer'

module UserNotif
  class NotifMailer < ActionMailer::Base
    def notif_email(notif_id)
      notif = Notif.find(notif_id)
      @target = notif.target
      @user = notif.user
      send_email({
                   to: @user.email,
                   template_path: 'notifs/mailer',
                   template_name: notif.template_name
                 }.merge(notif.email_options)
      )
    end

    private

    def send_email(opts)
      opts.delete(:attachments).each { |k| attachments[k[0]] = k[1] }
      mail(opts)
    end
  end
end
