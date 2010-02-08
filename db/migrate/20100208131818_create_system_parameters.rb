class CreateSystemParameters < ActiveRecord::Migration
  def self.up
    create_table :system_parameters do |t|
      t.string :code, :null
      t.string :value, :null 

      t.timestamps
    end
  end

  def self.down
    drop_table :system_parameters
  end
end
