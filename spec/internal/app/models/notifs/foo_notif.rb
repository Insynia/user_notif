class FooNotif < UserNotif::Notif
  def template_name
    'foo_notif'
  end

  def email_options
    super({
      subject: I18n.t('notif.foo.subject')
    })
  end

  def target_class
    User
  end
end
