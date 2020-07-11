class Boat < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  validates :name, presence: { message: 'You must pick the name of your boat' }
  # uncomment after development of controller

  # validates :description, presence: true, length: { minimum: 100 }
  # validates :capacity, presence: true, inclusion: { in: [2, 4, 6],
  #                                              message: "Please choose the capacity" }
  # validates :location, presence: true
  # validates :price, presence: true, numericality: { message: 'must be a number' }
  # validates :category, presence: true, inclusion: { in: ['motorboat', 'sailboat'] }
end
