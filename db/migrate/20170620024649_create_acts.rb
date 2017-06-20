class CreateActs < ActiveRecord::Migration[5.1]
  def change
    create_table :acts do |t|
      t.string :name
      t.string :good_for
      t.string :description
      t.string :photo
      t.references :users
      t.string :genre

      t.timestamps
    end
  end
end
