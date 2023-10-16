class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :user_chatrooms
  has_many :users, through: :user_chatrooms

  def self.private_chatroom_exists?(id1, id2)
    user1 = User.find_by(id: id1)
    user2 = User.find_by(id: id2)
    return false unless user1 && user2

    return Chatroom.find_by_sql(
      "#{private_chatrooms_for_user_query(user1)}
      INTERSECT
      #{private_chatrooms_for_user_query(user2)}"
    ).any?
  end

  private

  def private_chatrooms_for_user_query(user)
    Chatroom.where(users_count: 2)
            .joins(:user_chatrooms)
            .where(user_chatrooms: { user_id: user.id })
            .group('chatrooms.id')
            .to_sql
  end
  # before_validation :sort_and_uniquify_participant_ids

  # validates :participant_ids, presence: true, length: { minimum: 2 }

  # validates_uniqueness_of :participant_ids
  # validate :users_exist?

  # def recipient(current)
  #   (participants - [current]).first
  # end

  # def participants
  #   User.where(id: participant_ids)
  # end

  # private

  # def sort_and_uniquify_participant_ids
  #   self.participant_ids = participant_ids.uniq.sort
  # end

  # def users_exist?
  #   return true if participant_ids.count == participants.count

  #   errors.add(:participant_ids, 'Non-existent user(s)')
  # end
end
