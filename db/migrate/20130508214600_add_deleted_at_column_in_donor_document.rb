class AddDeletedAtColumnInDonorDocument < ActiveRecord::Migration
  def change
    add_column :donor_documents, :deleted_at, :time
  end
end