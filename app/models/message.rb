class Message < ActiveRecord::Base
  belongs_to :user, required: true
  validates :content, presence: true
end
