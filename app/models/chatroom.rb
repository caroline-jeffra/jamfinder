class Chatroom < ApplicationRecord
  has_many :messages, :user_chatrooms
end
