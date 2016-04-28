require 'spec_helper'

describe UserNotif do
  it 'has a version number' do
    expect(UserNotif::VERSION).not_to be nil
  end

  it 'has a Notif class' do
    expect(UserNotif::Notif).not_to be nil
  end

  it 'has a NotifMailer class' do
    expect(UserNotif::NotifMailer).not_to be nil
  end

  it 'has a ModelException module' do
    expect(ModelExceptions).not_to be nil
  end

  it 'set the app name from initializer' do
    expect(UserNotif.app_name).to eq 'My App'
  end

  it 'set the mailer sender from initializer' do
    expect(UserNotif.mailer_sender).to eq 'contact@myapp.com'
  end
end
