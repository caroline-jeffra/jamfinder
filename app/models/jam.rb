class Jam < ApplicationRecord
  has_many :user_jams, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates_comparison_of :date, greater_than_or_equal_to: Time.now
  validates :date, :address, presence: true
end
