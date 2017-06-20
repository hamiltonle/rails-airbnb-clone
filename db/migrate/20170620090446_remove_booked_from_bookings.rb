class RemoveBookedFromBookings < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :booked, :boolean
  end
end
