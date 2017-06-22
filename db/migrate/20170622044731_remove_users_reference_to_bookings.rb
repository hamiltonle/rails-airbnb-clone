class RemoveUsersReferenceToBookings < ActiveRecord::Migration[5.1]
  def change
    remove_reference :bookings, :users, foreign_key: true, index: true
  end
end
