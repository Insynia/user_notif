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

    def subject_email
      I18n.t('notif.generic.subject')
    end

    def target_class
      nil
    end

    private

    def validate_target_and_user
      raise ModelExceptions::BadTypeNotification unless self.target.class == target_class
      raise ModelExceptions::NotificationOwnerNil if self.user == nil
    end

    def notify_email
      return unless email?
      NotifMailer.notif_email(self.id).deliver_later
    end
  end
end