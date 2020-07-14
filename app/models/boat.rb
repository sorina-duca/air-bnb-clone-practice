class Boat < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  validates :name, presence: { message: 'You must pick the name of your boat' }
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_many :reviews, dependent: :destroy
  # uncomment after development of controller

  # validates :description, presence: true, length: { minimum: 100 }
  # validates :capacity, presence: true, inclusion: { in: [2, 4, 6],
  #                                              message: "Please choose the capacity" }
  validates :location, presence: true
  # validates :price, presence: true, numericality: { message: 'must be a number' }
  # validates :category, presence: true, inclusion: { in: ['motorboat', 'sailboat'] }
end
