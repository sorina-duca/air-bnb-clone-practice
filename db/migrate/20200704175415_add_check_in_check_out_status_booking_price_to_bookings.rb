class AddCheckInCheckOutStatusBookingPriceToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :checkin, :datetime
    add_column :bookings, :checkout, :datetime
    add_column :bookings, :status, :string
    add_column :bookings, :booking_price, :integer
    add_reference :bookings, :user, null: false, foreign_key: true
    add_reference :bookings, :boat, null: false, foreign_key: true
  end
end
