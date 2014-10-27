require "#{File.dirname(__FILE__)}/spec_helper"

describe 'user' do
  before(:each) do
    @user = User.new(:email => 'test@email.com',
                     :password => 'test_pasword')
  end

  specify 'should be valid' do
    @user.should be_valid
  end

  specify 'should have more specs' do
    pending
  end
end
