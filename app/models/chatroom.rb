class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :user_chatrooms
  before_validation :sort_participant_ids

  validates_uniqueness_of :participant_ids

  private

  def sort_participant_ids
    self.participant_ids = participant_ids.sort
  end
end
