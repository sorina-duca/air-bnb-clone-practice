class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: true
  validates :bio, presence: true
  has_many :boats, dependent: :destroy
  has_many :bookings
  has_one_attached :photo
end
