require 'spec_helper'

ActiveRecord::Migration.verbose = false
ActiveRecord::Base.logger = Logger.new(nil)
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

ActiveRecord::Base.connection.instance_eval do
  create_table :notifs do |t|
    t.references :target, polymorphic: true, index: true
    t.belongs_to :user, index: true
    t.boolean :unread, index: true, default: true
    t.string :type
    t.timestamps null: false
  end
end

describe UserNotif::Notif do
  let(:notif) { UserNotif::Notif.new }

  it 'raises an exception with an invalid target' do
    expect { UserNotif::Notif.new(target: nil) }.to raise_error ModelExceptions::BadTypeNotification
  end

  describe '#email?' do
    it 'returns true' do
      expect(notif.email?).to eq true
    end
  end

  describe '#email_template' do
    it 'returns generic_notif' do
      expect(notif.email_template).to eq 'generic_notif'
    end
  end

  describe '#subject_email' do
    it 'returns subject_email' do
      expect(notif.subject_email).to eq I18n.t('notif.generic.subject')
    end
  end
end
