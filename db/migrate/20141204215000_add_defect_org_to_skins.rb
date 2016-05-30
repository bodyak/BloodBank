class AddDefectOrgToSkins < ActiveRecord::Migration

  def change
    add_column :skins, :defect_org_id, :integer
  end

end