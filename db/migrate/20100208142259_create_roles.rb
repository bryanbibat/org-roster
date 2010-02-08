class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name, :null => false
      t.references :committee, :null => false
      t.text :description
      t.boolean :unique

      t.timestamps
    end
  end

  def self.down
    drop_table :roles
  end
end
