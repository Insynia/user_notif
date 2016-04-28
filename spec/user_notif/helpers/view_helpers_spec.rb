require 'spec_helper'

describe UserNotif::ViewHelpers, type: :helper do
  let(:helper) { UserNotif::ViewHelpers }

  describe '#notif' do
    context 'when small == true' do
      it 'renders the right template' do
        skip 'Waiting for view helpers'
        expect(helper.notif(UserNotif::Notif.new, true)).to render_template(partial: 'notifications/small/_generic_notif')
      end
    end

    context 'when small == false' do
      it 'renders the right template' do
        skip 'Waiting for view helpers'
        expect(helper.notif(UserNotif::Notif.new, false)).to render_template(partial: 'notifications/full/_generic_notif')
      end
    end
  end

  describe '#list_notifs' do
    let(:list_notif) { [UserNotif::Notif.new, UserNotif::Notif.new, UserNotif::Notif.new] }

    context 'when small == true' do
      it 'calls the notif methods with the good arguments the right number of times' do
        skip 'Waiting for view helpers'
        expect(helper).to receive(:list_notifs).with(list_notif, true).exactly(list_notif.count).times
        helper.list_notif(list_notifs, true)
      end
    end

    context 'when small == false' do
      it 'calls the notif methods with the good arguments the right number of times' do
        skip 'Waiting for view helpers'
        expect(helper).to receive(:list_notifs).with(list_notif, false).exactly(list_notif.count).times
        helper.list_notif(list_notifs, false)
      end
    end
  end
end
