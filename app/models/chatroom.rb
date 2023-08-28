class Chatroom < ApplicationRecord
  has_many :messages
  has_many :user_chatrooms
end
