class UpdateColumnDoctorAidsInVisit < ActiveRecord::Migration
  def change
    Visit.where("doctor_aid_id is null").update_all("doctor_aid_id = 0")
  end
end