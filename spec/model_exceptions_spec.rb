require 'spec_helper'

describe UserNotif::ModelExceptions do
  it 'has a ModelException module' do
    expect(UserNotif::ModelExceptions::BadTypeNotification).not_to be nil
  end
end