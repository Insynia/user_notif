require 'spec_helper'

describe UserNotif::Notif do
  let(:notif) { UserNotif::Notif.new }

  it 'raises an exception with an invalid target' do
    expect { UserNotif::Notif.create(target: nil) }.to raise_error ModelExceptions::BadTypeNotification
  end

  it 'raises an exception with empty user' do
    allow(notif).to receive(:target_class) { NilClass }
    expect { notif.save }.to raise_error ModelExceptions::NotifOwnerNil
  end

  describe '#email?' do
    it 'returns true' do
      expect(notif.email?).to eq true
    end
  end

  describe '#email_template' do
    it 'returns generic_notif' do
      expect(notif.template_name).to eq 'generic_notif'
    end
  end

  describe '#email_options' do
    context 'with no custom options' do
      it 'contains the right subject email' do
        expect(notif.email_options[:subject]).to eq I18n.t('notif.generic.subject')
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

  describe '#notify_email' do
    let(:user) { User.create(email: 'ganesh.desfleurs@gmail.com') }
    let(:notif) { UserNotif::Notif.new(user: user) }

    before do
      allow(notif).to receive(:email?) { true }
      allow(notif).to receive(:target_class) { NilClass }
    end

    context 'when email? returns true' do
      it 'sends an email' do
        expect { notif.save }.to change { ActionMailer::Base.deliveries.count }.by 1
      end
    end

    context 'when email? returns false' do
      before do
        allow(notif).to receive(:email?) { false }
      end

      it 'does not send an email' do
        expect { notif.save }.to change { ActionMailer::Base.deliveries.count }.by 0
      end
    end
  end
end
