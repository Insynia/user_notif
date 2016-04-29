require 'active_record'

module UserNotif
  class Notif < ActiveRecord::Base
    belongs_to :target, polymorphic: true
    belongs_to :user

    scope :unread, -> { where(unread: true) }

    before_save :validate_target_and_user
    after_create :notify_email

    def email?
      true
    end

    def template_name
      'generic_notif'
    end

    def email_options(opts = {})
      #TODO: reply-to, cc, date
      {
        subject: I18n.t('notif.generic.subject'),
        bcc: UserNotif.mailer_bcc,
        return_path: UserNotif.mailer_return_path,
        from: UserNotif.mailer_sender
      }.merge(opts)
    end

    def target_class
      nil # Has to be overriden
    end

    private

    def validate_target_and_user
      raise ModelExceptions::BadTypeNotification unless self.target.class == target_class
      raise ModelExceptions::NotifOwnerNil if self.user == nil
    end

    def notify_email
      return unless email?
      NotifMailer.notif_email(self.id).deliver_later
    end
  end
end