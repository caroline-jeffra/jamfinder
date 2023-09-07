class Genre < ApplicationRecord
  has_many :user_genres, dependent: :destroy
  before_validation :capitalize_attributes
  validates :name, presence: true
  validates_uniqueness_of :name

  private

  def capitalize_attributes
    name.capitalize!
  end
end
