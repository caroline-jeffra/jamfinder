class Jam < ApplicationRecord
  has_many :user_jams, dependent: :destroy
end
