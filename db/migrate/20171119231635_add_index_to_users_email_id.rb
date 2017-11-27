class AddIndexToUsersEmailId < ActiveRecord::Migration
  def change
    add_index :users, :emailID, unique: true
  end
end
