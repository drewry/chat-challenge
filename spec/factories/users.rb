FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'simplechat123!'
    password_confirmation 'simplechat123!'
  end
end
