class RenameOrderFromBatch < ActiveRecord::Migration
  def self.up
    rename_column :batches, :order, :applicant_batch
  end

  def self.down
    rename_column :batches, :applicant_batch, :order
  end
end
