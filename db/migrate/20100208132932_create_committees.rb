class CreateCommittees < ActiveRecord::Migration
  def self.up
    create_table :committees do |t|
      t.string :code, :null => false
      t.string :full_name, :null => false
      t.integer :year_added, :null => false
      t.integer :year_removed
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :committees
  end
end
