class UserInstrument < ApplicationRecord
  belongs_to :user
  belongs_to :instrument

  validates :user, uniqueness: { scope: :instrument }
end
