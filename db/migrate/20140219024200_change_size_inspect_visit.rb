class ChangeSizeInspectVisit < ActiveRecord::Migration

  def self.up
    change_column(:visits, :inspect_syphilis, :decimal, {precision: 1, scale: 0})
    change_column(:visits, :inspect_hep_b, :decimal, {precision: 1, scale: 0})
    change_column(:visits, :inspect_hep_c, :decimal, {precision: 1, scale: 0})
    change_column(:visits, :inspect_aids, :decimal, {precision: 1, scale: 0})
  end

  def self.down
    change_column(:visits, :inspect_syphilis, :integer)
    change_column(:visits, :inspect_hep_b, :integer)
    change_column(:visits, :inspect_hep_c, :integer)
    change_column(:visits, :inspect_aids, :integer)
  end

end