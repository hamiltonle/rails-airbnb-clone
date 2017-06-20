class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.datetime :time
      t.string :address
      t.boolean :booked
      t.references :users, foreign_key: true
      t.references :acts, foreign_key: true

      t.timestamps
    end
  end
end
