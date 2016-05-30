class UpdateColumnsInDonor < ActiveRecord::Migration
  def change
    Donor.where("card_number is null").update_all("card_number = 0")
    Donor.where("code_org is null").update_all("code_org = 21")
    Donor.where("cat_donor_id is null").update_all("cat_donor_id = 0")
    Donor.where("org_donate_id is null").update_all("org_donate_id = 0")
    Donor.update_all ['visit_date = ?', Time.now], ['visit_date is ?', nil]
    Donor.update_all ['reg_date = ?', Time.now], ['reg_date is ?', nil]
    Donor.where("reg_name_id is null").update_all("reg_name_id = 0")
    Donor.where("doctor_chief_id is null").update_all("doctor_chief_id = 0")
    Donor.where("blood_group_id is null").update_all("blood_group_id = 0")
    Donor.where("rh_factor_id is null").update_all("rh_factor_id = 0")
    Donor.where("first_name is null").update_all("first_name = '#{I18n.t("donor.no_first_name")}'")
    Donor.where("middle_name is null").update_all("middle_name = '#{I18n.t("dictionary.no_value")}'")
    Donor.where("last_name is null").update_all("last_name = '#{I18n.t("donor.no_last_name")}'")
    Donor.where("gender is null").update_all("gender = true")
  end
end