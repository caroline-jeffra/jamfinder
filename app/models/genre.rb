class Genre < ApplicationRecord
  has_many :user_genres, dependent: :destroy
  validates :name, presence: true
  validates_uniqueness_of :name

  include PgSearch::Model
  pg_search_scope :search,
                  against: :name,
                  using: {
                    tsearch: { prefix: true }
                  }
end
