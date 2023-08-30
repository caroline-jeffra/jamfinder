class Audio < ApplicationRecord
  belongs_to :user
  validates :url, presence: true

  has_one_attached :cl_audio_url
end
