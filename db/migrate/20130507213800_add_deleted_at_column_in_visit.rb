class AddDeletedAtColumnInVisit < ActiveRecord::Migration
  def change
    add_column :visits, :deleted_at, :time
  end
end