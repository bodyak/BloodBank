class ChangeColumnsInDonorDefect < ActiveRecord::Migration
  def self.up
    change_column(:donor_defects, :donor_id, :integer, {:null => false})
    change_column(:donor_defects, :defect_org_id, :integer, {:null => false})
    change_column(:donor_defects, :defect_cause_id, :integer, {:null => false})
  end
end