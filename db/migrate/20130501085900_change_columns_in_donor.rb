class ChangeColumnsInDonor < ActiveRecord::Migration
  def self.up
    change_column(:donors, :card_number, :decimal, {:precision => 16, :scale => 0, :null => false})
    change_column(:donors, :code_org, :decimal, {:precision => 10, :scale => 0, :null => false})
    change_column(:donors, :cat_donor_id, :integer, {:null => false})
    change_column(:donors, :org_donate_id, :integer, {:null => false})
    change_column(:donors, :visit_date, :date, {:null => false})
    change_column(:donors, :reg_date, :date, {:null => false})
    change_column(:donors, :reg_name_id, :integer, {:null => false})
    change_column(:donors, :doctor_chief_id, :integer, {:null => false})
    change_column(:donors, :blood_group_id, :integer, {:null => false})
    change_column(:donors, :rh_factor_id, :integer, {:null => false})
    change_column(:donors, :first_name, :string, {:limit => 30, :null => false})
    change_column(:donors, :middle_name, :string, {:limit => 30, :null => false})
    change_column(:donors, :last_name, :string, {:limit => 30, :null => false})
    change_column(:donors, :gender, :boolean, {:null => false})
    change_column(:donors, :post_code, :string, {:limit => 20})
    change_column(:donors, :address, :string, {:limit => 100})
    change_column(:donors, :tel_home, :string, {:limit => 50})
    change_column(:donors, :work, :string, {:limit => 100})
    change_column(:donors, :job, :string, {:limit => 100})
    change_column(:donors, :tel_work, :string, {:limit => 50})
  end
end