class CreateBatches < ActiveRecord::Migration
  def self.up
    create_table :batches do |t|
      t.string :name
      t.integer :order
      t.integer :year

      t.timestamps
    end
  end

  def self.down
    drop_table :batches
  end
end
