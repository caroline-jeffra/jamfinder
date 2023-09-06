class Genre < ApplicationRecord
  has_many :user_genres, dependent: :destroy
  validates :name, presence: true
  validates_uniqueness_of :name
end
