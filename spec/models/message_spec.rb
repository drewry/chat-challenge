require 'rails_helper'

RSpec.describe Message, type: :model do
  before :each do
    @message = FactoryGirl.create :message, user: FactoryGirl.create(:user)
  end

  it "should belong to a user" do
    @message.user.nil?.should eq false
  end
end
