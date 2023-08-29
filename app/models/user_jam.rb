class UserJam < ApplicationRecord
  belongs_to :user
  belongs_to :jam

  validates :user, uniqueness: { scope: :jam }
end
