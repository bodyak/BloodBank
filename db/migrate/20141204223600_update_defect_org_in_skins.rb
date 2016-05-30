class UpdateDefectOrgInSkins < ActiveRecord::Migration

  def change
    Skin.where("defect_org_id is null").update_all("defect_org_id = 0")
  end

end