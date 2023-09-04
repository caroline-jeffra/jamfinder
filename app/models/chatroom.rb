class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :user_chatrooms
  before_validation :sort_and_uniquify_participant_ids

  validates :participant_ids, presence: true, length: { minimum: 2 }

  validates_uniqueness_of :participant_ids
  validate :users_exist?

  def recipient(current)
    (participants - [current]).first
  end

  def participants
    User.where(id: participant_ids)
  end

  private

  def sort_and_uniquify_participant_ids
    self.participant_ids = participant_ids.uniq.sort
  end

  def users_exist?
    return true if participant_ids.count == participants.count

    errors.add(:participant_ids, 'Non-existent user(s)')
  end
end
