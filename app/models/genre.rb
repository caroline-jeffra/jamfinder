class Genre < ApplicationRecord
  has_many :user_genres, dependent: :destroy
end
