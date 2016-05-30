class AddPostInspectFieldsInVisits < ActiveRecord::Migration

  def change
    add_column :visits, :post_inspect_syphilis, :boolean
    add_column :visits, :post_date_syphilis, :date
    add_column :visits, :org_syphilis_id, :integer
    add_column :visits, :post_inspect_hep_c, :boolean
    add_column :visits, :post_date_hep_c, :date
    add_column :visits, :org_hep_c_id, :integer
    add_column :visits, :post_inspect_hep_b, :boolean
    add_column :visits, :post_date_hep_b, :date
    add_column :visits, :org_hep_b_id, :integer
    add_column :visits, :post_inspect_aids, :boolean
    add_column :visits, :post_date_aids, :date
    add_column :visits, :org_aids_id, :integer
  end

end