class Video < ApplicationRecord
  belongs_to :user

  validates :url, presence: true

  has_one_attached :cl_video_url
end
