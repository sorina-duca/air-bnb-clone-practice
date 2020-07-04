class Boat < ApplicationRecord
  belongs_to :user
  validates :name, presence: { message: 'You must pick the name of your boat' }
  validates :description, presence: true, length: { minimum: 100 }
  validates :capacity, presence: true, inclusion: { in: [2, 4, 6],
                                               message: "Please choose the capacity" }
  validates :location, presence: true
  validates :price, presence: true, numericality: { message: 'must be a number' }
  validates :type, presence: true, inclusion: { in: ['motorboat', 'sailboat'] }
end
