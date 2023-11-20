class Instrument < ApplicationRecord
  has_many :user_instruments, dependent: :destroy

  CATEGORIES = %w[Vocal Keyboard String Percussion Wind]

  before_validation :format_attributes
  validates :name, :category, presence: true
  validates_inclusion_of :category, in: CATEGORIES
  validates_uniqueness_of :name

  private

  def format_attributes
    self.name = self.name.downcase.gsub(/ /, '-').gsub(/[^a-zA-Z0-9&-]/, '')
    category.capitalize!
  end
end
