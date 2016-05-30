class AddColumnDoctorAidsInVisit < ActiveRecord::Migration
  def change
    add_column :visits, :doctor_aid_id, :integer
  end
end