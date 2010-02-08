class AddBatchToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :batch_id, :integer
  end

  def self.down
    remove_column :users, :batch_id
  end
end
