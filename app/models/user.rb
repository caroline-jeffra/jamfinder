class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :audios, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :user_chatrooms, dependent: :destroy
  has_many :chatrooms, through: :user_chatrooms
  has_many :user_genres, dependent: :destroy
  has_many :genres, through: :user_genres
  has_many :user_instruments, dependent: :destroy
  has_many :instruments, through: :user_instruments
  has_many :user_jams, dependent: :destroy
  has_many :jams, through: :user_jams
  has_many :videos, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :first_name, :last_name, :address, presence: true
end
