class Message < ApplicationRecord
  belongs_to :chatroom, touch: true
  belongs_to :user

  default_scope { order(created_at: :asc) }

  validates :content, presence: true

  after_create_commit { broadcast_message }

  private

  def broadcast_message
    broadcast_append_to(
      "chatroom_#{chatroom_id}",
      target: "messages",
      partial: "messages/message",
      locals: { message: self }
    )
  end
end
