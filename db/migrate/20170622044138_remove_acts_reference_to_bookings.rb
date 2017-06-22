class RemoveActsReferenceToBookings < ActiveRecord::Migration[5.1]
  def change
    remove_reference :bookings, :acts, foreign_key: true, index: true
  end
end
