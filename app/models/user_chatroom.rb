class UserChatroom < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom, counter_cache: :users_count

  validates :user, uniqueness: { scope: :chatroom }
end
