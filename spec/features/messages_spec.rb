require 'rails_helper'

feature "Messages" do
  background do
    @user        = FactoryGirl.create :user
    @second_user = FactoryGirl.create :user

    FactoryGirl.create_list :message, 10, user: @user
    FactoryGirl.create_list :message, 10, user: @second_user

    @message = Message.first
    login_as @user
  end

  scenario "messages index should list all messages" do
    get '/messages'
    json['messages'].size.should eq 20
  end

  scenario "messages should show on id" do
    get "/messages/#{@message.id}"
    json["id"].should eq @message.id
  end

  scenario "messages should create for a user on content" do
    @content = Faker::Lorem.sentence
    post "/messages", message: { content: @content }
    json["user"]["id"].should eq @user.id
    json["content"].should eq @content
  end

end