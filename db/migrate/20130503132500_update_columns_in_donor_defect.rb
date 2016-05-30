class UpdateColumnsInDonorDefect < ActiveRecord::Migration
  def change
    DonorDefect.where("defect_org_id is null").update_all("defect_org_id = 0")
    DonorDefect.where("defect_cause_id is null").update_all("defect_cause_id = 0")
  end
end