class Image < ApplicationRecord
  belongs_to :user
  validates :url, presence: true

  has_one_attached :url
end
