class AddActReferenceToBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :act, foreign_key: true, index: true
  end
end
