class AddDeletedAtColumnInDonorDefect < ActiveRecord::Migration
  def change
    add_column :donor_defects, :deleted_at, :time
  end
end