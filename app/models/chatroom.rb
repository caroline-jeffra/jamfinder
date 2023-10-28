class Chatroom < ApplicationRecord
  include ActionView::RecordIdentifier

  has_many :messages, dependent: :destroy
  has_many :user_chatrooms, dependent: :destroy
  has_many :users, through: :user_chatrooms
  validates :users, presence: true, length: { minimum: 2 }
  validate :chatroom_does_not_exist?
  # after_create_commit { broadcast_append_to "chatrooms" }
  after_create_commit { broadcast_to_users }
  after_update_commit { broadcast_updates }

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

  def broadcast_to_users
    users.each do |user|
      broadcast_prepend_to "user_#{user.id}_chatrooms",
                           target: "chatrooms",
                           partial: 'chatrooms/chatroom',
                           locals: { chatroom: self, current: user }
    end
  end

  def broadcast_updates
    users.each do |user|
      broadcast_replace_to "user_#{user.id}_chatrooms",
                           target: dom_id(self),
                           partial: 'chatrooms/chatroom',
                           locals: { chatroom: self, current: user }
    end
  end
end
