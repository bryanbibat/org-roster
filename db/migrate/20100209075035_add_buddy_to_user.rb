class AddBuddyToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :buddy_id, :integer
  end

  def self.down
    remove_column :users, :buddy_id
  end
end
