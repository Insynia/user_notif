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
    expect(UserNotif::ModelExceptions).not_to be nil
  end
end
