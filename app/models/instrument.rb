class Instrument < ApplicationRecord
  has_many :user_instruments, dependent: :destroy

  CATEGORIES = %w[Vocal Keyboard String Percussion Wind]

  validates :name, :category, presence: true
  validates_inclusion_of :category, in: CATEGORIES
  validates_uniqueness_of :name

  include PgSearch::Model
  pg_search_scope :search,
                  against: :name,
                  using: {
                    tsearch: { prefix: true }
                  }
end
