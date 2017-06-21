class AddUserReferenceToActs < ActiveRecord::Migration[5.1]
  def change
    add_reference :acts, :user, foreign_key: true, index: true
  end
end
