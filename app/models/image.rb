class Image < ApplicationRecord
  belongs_to :user
  validates :user, :url, presence: true
end
