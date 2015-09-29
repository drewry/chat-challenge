require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = FactoryGirl.create :user
  end

  it "should have many messages" do
    @messages = FactoryGirl.create_list :message, 10, user: @user

    @user.messages.count.should eq 10
  end
end
