module UserNotif
  class Notif < ActiveRecord::Base
    include ModelExceptions

    belongs_to :target, polymorphic: true
    belongs_to :user

    after_create :notify_email

    def target=(t)
      raise ModelExceptions::BadTypeNotification unless t.class == TARGET_CLASS
      super(t)
    end

    def email?
      true
    end

    def email_template
      'generic_notif'
    end

    def subject_email
      I18n.t('notif.generic.subject')
    end

    private

    def notify_email
      return unless email?
      NotifMailer.delay.notif_email(self.id)
    end
  end
end
