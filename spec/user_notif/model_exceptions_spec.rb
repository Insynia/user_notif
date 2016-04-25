require 'spec_helper'

describe ModelExceptions do
  it 'has a ModelException module' do
    expect(ModelExceptions::BadTypeNotification).not_to be nil
  end
end