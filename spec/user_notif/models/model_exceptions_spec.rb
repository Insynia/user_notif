require 'spec_helper'

describe ModelExceptions do
  it 'has a BadTypeNotification class' do
    expect(ModelExceptions::BadTypeNotification).not_to be nil
  end

  it 'has a NotificationOwnerNil class' do
    expect(ModelExceptions::NotifOwnerNil).not_to be nil
  end
end