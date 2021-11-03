class AddIndexToGossip < ActiveRecord::Migration[5.2]
  def change
    add_reference :gossips, :user, foreign_key: true
    add_reference :users, :gossips, foreign_key: true
  end
end
