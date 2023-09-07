class Instrument < ApplicationRecord
  has_many :user_instruments, dependent: :destroy

  CATEGORIES = %w[Vocal Keyboard String Percussion Wind]

  before_validation :capitalize_attributes
  validates :name, :category, presence: true
  validates_inclusion_of :category, in: CATEGORIES
  validates_uniqueness_of :name

  private

  def capitalize_attributes
    name.capitalize!
    category.capitalize!
  end
end
