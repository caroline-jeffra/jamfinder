class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :user_chatrooms, dependent: :destroy
  has_many :users, through: :user_chatrooms
  validates :users, presence: true, length: { minimum: 2 }
  validate :chatroom_does_not_exist?

  def self.exists_for_users?(users)
    return find_by_users(users).present?
  end

  def self.find_by_users(users)
    chatrooms = Chatroom.where(users_count: users.length)
    users.reduce(chatrooms) { |c, u| c.where(id: u.chatrooms) }.first
  end

  def recipient(current)
    (users - [current]).first
  end

  private

  def chatroom_does_not_exist?
    return true unless Chatroom.exists_for_users?(users)

    errors.add(:users, "Chatroom already exists for users #{users.map(&:id)}")
  end
end
