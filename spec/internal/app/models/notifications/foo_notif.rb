class FooNotif < UserNotif::Notif
  def email?
    # Override or delete (default: true)
  end

  def template_name
    'foo_notif'
  end

  def subject_email
    I18n.t('notif.foo.subject')
  end

  def target_class
    User
  end
end
