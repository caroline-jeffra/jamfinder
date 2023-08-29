class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  validates :content, :chatroom, :user, presence: true
end
