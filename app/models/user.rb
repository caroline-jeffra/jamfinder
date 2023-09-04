class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Callbacks
  before_create :set_display_name_default
  before_create :set_default_background
  before_create :set_default_avatar

  # Relations
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

  # Cloudinary
  has_one_attached :cl_avatar_url
  has_one_attached :cl_banner_url

  # Geocoder
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # Validations
  validates :first_name, :last_name, :address, presence: true

  include PgSearch::Model
  pg_search_scope :search,
    against: [:address, :display_name],
    associated_against: {
      genres: [ :name ],
      instruments: [ :name, :category ]
    },
    using: {
      tsearch: { prefix: true }
    }

  def coordinates
    [latitude, longitude] if attributes.values_at("latitude", "longitude").all?
  end

  GENRES = ['Rock','Pop','Hip-hop','Jazz','Classical','Electronic','R&B','Country','Reggae','Metal', 'Ska']


  private

  def set_display_name_default
    self.display_name = first_name if display_name.nil?
  end

  def set_default_background
    default = 'http://res.cloudinary.com/drxcsc3ye/image/upload/v1693476762/purple_background.png'
    self.banner_url = default if banner_url.nil?
  end

  def set_default_avatar
    default = 'https://www.dlf.pt/dfpng/middlepng/276-2761324_transparent-default-avatar-png-profile-no-image-icon.png'
    self.avatar_url = default if avatar_url.nil?
  end
end
