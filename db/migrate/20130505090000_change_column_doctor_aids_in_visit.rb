class ChangeColumnDoctorAidsInVisit < ActiveRecord::Migration
  def self.up
    change_column(:visits, :doctor_aid_id, :integer, {:null => false})
  end
end