class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :user_chatrooms, dependent: :destroy
  has_many :users, through: :user_chatrooms

  def self.private_chatroom_exists?(id1, id2)
    user1 = User.find_by(id: id1)
    user2 = User.find_by(id: id2)
    return false unless user1 && user2

    return find_chatroom(user1, user2).any?
  end

  def self.find_chatroom(user1, user2)
    Chatroom.find_by_sql(
      "#{user_private_chatrooms_query(user1)}
      INTERSECT
      #{user_private_chatrooms_query(user2)}"
    )
  end

  private_class_method def self.user_private_chatrooms_query(user)
    Chatroom.where(users_count: 2)
            .joins(:user_chatrooms)
            .where(user_chatrooms: { user_id: user.id })
            .group('chatrooms.id')
            .to_sql
  end
end
