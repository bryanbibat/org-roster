class CreatePositions < ActiveRecord::Migration
  def self.up
    create_table :positions do |t|
      t.references :user, :null => false
      t.references :committee, :null => false
      t.references :role, :null => false
      t.integer :year

      t.timestamps
    end
  end

  def self.down
    drop_table :positions
  end
end
