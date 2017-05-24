require 'spec_helper'

describe FooNotif do
  let(:user) { User.create(email: 'ganesh.desfleurs@gmail.com') }
  let(:notif) { FooNotif.new(user: user, target: user) }

  describe '#email_template' do
    it 'returns foo_notif' do
      expect(notif.template_name).to eq 'foo_notif'
    end
  end

  describe '#email_options' do
    it 'contains the right subject email' do
      expect(notif.email_options[:subject]).to eq I18n.t('notif.foo.subject')
    end

    it 'contains the right bcc' do
      expect(notif.email_options[:bcc]).to eq UserNotif.mailer_bcc
    end

    it 'contains the right return path' do
      expect(notif.email_options[:return_path]).to eq UserNotif.mailer_return_path
    end

    it 'contains the right from' do
      expect(notif.email_options[:from]).to eq UserNotif.mailer_sender
    end
  end
end
