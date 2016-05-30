class AddDeletedAtColumnInDonor < ActiveRecord::Migration
  def change
    add_column :donors, :deleted_at, :time
  end
end