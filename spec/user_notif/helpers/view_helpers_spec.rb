require 'spec_helper'

def count_substrings(str, sub)
  str.scan(sub).length
end

describe UserNotif::ViewHelpers, type: :helper do
  let(:user) { User.create(email: 'ganesh.desfleurs@gmail.com') }
  let(:notif) { FooNotif.create(user: user, target: user) }

  describe '#user_notif' do
    context 'when small == true' do
      subject { user_notif(notif, true) }

      it 'has one small user notif tag' do
        expect(count_substrings(subject, '<div class="small-user-notif">')).to eq 1
      end

      it 'has one small title tag' do
        expect(count_substrings(subject, '<div class="notif-title">')).to eq 1
      end

      it 'has one small content tag' do
        expect(count_substrings(subject, '<div class="notif-content">')).to eq 1
      end
    end

    context 'when small == false' do
      subject { user_notif(notif, false) }

      it 'has one user notif tag' do
        expect(count_substrings(subject, '<div class="user-notif">')).to eq 1
      end

      it 'has one user title tag' do
        expect(count_substrings(subject, '<div class="notif-title">')).to eq 1
      end

      it 'has one user content tag' do
        expect(count_substrings(subject, '<div class="notif-content">')).to eq 1
      end
    end
  end

  describe '#list_user_notifs' do
    let(:notif2) { FooNotif.create(user: user, target: user) }
    let(:notif3) { FooNotif.create(user: user, target: user) }
    let(:list_notifs) { [notif, notif2, notif3] }

    context 'when small == true' do
      subject { list_user_notifs(list_notifs, true) }

      it 'has one small user notif tag' do
        expect(count_substrings(subject, '<div class="small-user-notif">')).to eq 3
      end

      it 'has one small title tag' do
        expect(count_substrings(subject, '<div class="notif-title">')).to eq 3
      end

      it 'has one small content tag' do
        expect(count_substrings(subject, '<div class="notif-content">')).to eq 3
      end
    end

    context 'when small == false' do
      subject { list_user_notifs(list_notifs, false) }

      it 'has one user notif tag' do
        expect(count_substrings(subject, '<div class="user-notif">')).to eq 3
      end

      it 'has one user title tag' do
        expect(count_substrings(subject, '<div class="notif-title">')).to eq 3
      end

      it 'has one user content tag' do
        expect(count_substrings(subject, '<div class="notif-content">')).to eq 3
      end
    end
  end

  describe '#notif_badge' do
    context 'When having 1 notif' do
      it 'should render a badge' do
        expect(notif_badge([notif])).to eq "<span class=\"notif-badge\">1</span>"
      end
    end

    context 'When having no unread notif' do
      it 'should not render a badge' do
        expect(notif_badge([])).to eq ''
      end
    end
  end
end
