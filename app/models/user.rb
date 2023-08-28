class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :audios
  has_many :images
  has_many :messages
  has_many :user_chatrooms
  has_many :chatrooms, through: :user_chatrooms
  has_many :user_genres
  has_many :genres, through: :user_genres
  has_many :user_instruments
  has_many :instruments, through: :user_instruments
  has_many :user_jams
  has_many :jams, through: :user_jams
  has_many :videos
end
