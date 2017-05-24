require 'spec_helper'
require 'rspec/rails'

describe UserNotif::NotifsController, type: :controller do
  let(:user) { User.create(email: 'foo@bar.com') }
  let(:notif) { FooNotif.create(target: user, user: user) }

  describe 'PUT #read' do
    context 'with an authorized user' do
      before { allow(controller).to receive(:current_user) { user } }

      context 'with a correct notif id' do
        it 'sets unread to false for given notification' do
          put :read, params: { id: notif.id }
          expect(notif.reload.unread).to eq false
        end
      end

      context 'with an incorrect notif id' do
        it 'raises an ActiveRecord::RecordNotFound exception' do
          expect { put :read, params: { id: notif.id + 1 } }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end

    context 'with an unauthorized user' do
      let(:user2) { User.create(email: 'bar@foo.com') }

      before { allow(controller).to receive(:current_user) { user2 } }

      it 'raises an ActiveRecord::RecordNotFound exception' do
        expect { put :read, params: { id: notif.id } }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
