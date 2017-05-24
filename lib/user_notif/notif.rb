require 'active_record'

module UserNotif
  class Notif < ActiveRecord::Base
    belongs_to :target, polymorphic: true
    belongs_to :user

    scope :unread, -> { where(unread: true) }

    before_save :validate_target_and_user
    after_commit :notify_email, on: :create

    def email?
      true
    end

    def template_name
      'generic_notif'
    end

    def email_options(opts = {})
      {
        subject: I18n.t('notif.generic.subject'),
        bcc: UserNotif.mailer_bcc,
        return_path: UserNotif.mailer_return_path,
        from: UserNotif.mailer_sender,
        reply_to: UserNotif.mailer_reply_to,
        cc: UserNotif.mailer_cc,
        date: Time.current
      }.merge(opts)
    end

    def target_class
      nil # Has to be overriden
    end

    private

    def validate_target_and_user
      raise ModelExceptions::BadTypeNotification unless target.class == target_class
      raise ModelExceptions::NotifOwnerNil if user.nil?
    end

    def notify_email
      return unless email?
      NotifMailer.notif_email(id).deliver_later
    end
  end
end
