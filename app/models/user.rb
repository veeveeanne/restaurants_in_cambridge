class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :votes 

  validates :screen_name, presence: true, uniqueness: true

  mount_uploader :profile_photo, ProfilePhotoUploader

  def admin?
    role == "admin"
  end
end
