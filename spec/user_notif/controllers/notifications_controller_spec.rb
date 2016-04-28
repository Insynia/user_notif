require 'spec_helper'
require 'rspec/rails'

describe UserNotif::NotificationsController, type: :controller do
  let(:user) { User.create(email: 'foo@bar.com') }
  let(:notif) { FooNotif.create(target: user, user: user) }

  describe 'PUT #read' do
    context 'with a correct notif id' do
      it 'sets unread to false for given notification' do
        put :read, id: notif.id
        expect(notif.reload.unread).to eq false
      end
    end

    context 'with an incorrect notif id' do
      it 'raises an ActiveRecord::RecordNotFound exception' do
        expect { put :read, id: notif.id + 1 }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end