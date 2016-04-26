require 'spec_helper'

describe UserNotif::Notif do
  let(:notif) { UserNotif::Notif.new }

  it 'raises an exception with an invalid target' do
    expect { UserNotif::Notif.create(target: nil) }.to raise_error ModelExceptions::BadTypeNotification
  end

  it 'raises an exception with empty user' do
    allow(notif).to receive(:target_class) { NilClass }
    expect { notif.save }.to raise_error ModelExceptions::NotificationOwnerNil
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

  describe '#subject_email' do
    it 'returns subject_email' do
      expect(notif.subject_email).to eq I18n.t('notif.generic.subject')
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
