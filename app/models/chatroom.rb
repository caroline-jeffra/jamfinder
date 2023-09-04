class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :user_chatrooms
  before_validation :sort_participant_ids

  validates :participant_ids, presence: true

  # TODO: UNIQUENESS DOES NOT WORK
  validates_uniqueness_of :participant_ids

  def recipient(current)
    (participants - [current]).first
  end

  def participants
    User.find(participant_ids)
  end

  private

  def sort_participant_ids
    self.participant_ids = participant_ids.uniq.sort
  end
end
