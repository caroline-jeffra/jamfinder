class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :user_chatrooms, dependent: :destroy
  has_many :users, through: :user_chatrooms

  def self.private_chatroom_exists?(id1, id2)
    user1 = User.find_by(id: id1)
    user2 = User.find_by(id: id2)
    return false unless user1 && user2

    return find_private_chatroom(user1, user2).present?
  end

  def self.find_private_chatroom(user1, user2)
    (user1.chatrooms & user2.chatrooms).filter { |c| c.users_count == 2 }.first
  end

  def recipient(current)
    (users - [current]).first
  end
end
