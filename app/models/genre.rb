class Genre < ApplicationRecord
  has_many :user_genres, dependent: :destroy
  before_validation :format_name
  validates :name, presence: true
  validates_uniqueness_of :name

  private

  def format_name
    self.name = self.name.downcase.gsub(/ /, '-').gsub(/[^a-zA-Z0-9&-]/, '')
  end
end
