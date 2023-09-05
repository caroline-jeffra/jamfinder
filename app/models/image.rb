class Image < ApplicationRecord
  belongs_to :user
  validates :url, presence: true

  has_many_attached :photos
end
