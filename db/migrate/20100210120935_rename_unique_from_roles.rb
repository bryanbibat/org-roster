class RenameUniqueFromRoles < ActiveRecord::Migration
  def self.up
    rename_column :roles, :unique, :execom
  end

  def self.down
    rename_column :roles, :execom, :unique
  end
end
