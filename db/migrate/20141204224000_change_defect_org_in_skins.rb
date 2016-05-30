class ChangeDefectOrgInSkins < ActiveRecord::Migration

  def change
    change_column(:skins, :defect_org_id, :integer, {null: false})
  end

end