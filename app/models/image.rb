class Image < ApplicationRecord
  belongs_to :user
  validates :url, presence: true
end
