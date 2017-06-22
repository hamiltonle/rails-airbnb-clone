class AddUserReferenceToBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :user, foreign_key: true, index: true
  end
end
