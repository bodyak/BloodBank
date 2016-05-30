class ChangeColumnsInspectInVisit < ActiveRecord::Migration
  def self.up
    change_column(:visits, :inspect_bilirubin, :string, {:limit => 10, :null => false})
    change_column(:visits, :inspect_alt, :string, {:limit => 10, :null => false})
  end
end