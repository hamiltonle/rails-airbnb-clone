class AddBookingStatusToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :booking_status, :string
  end
end
