class DictionariesController < ApplicationController

  active_scaffold :dictionary do |config|
    config.sti_children = [:cat_donor, :blood_group, :country, :district, :doctor_chief, :hla_factor, :org_donate,
                           :region, :rh_factor, :village, :blood_for, :defect_cause, :defect_org, :doc, :doctor_test,
                           :doctor_skin, :doctor_donation, :doctor_therapist, :donation_mode, :donation_type,
                           :org_address, :reception, :rh_control, :send_dep, :send_org, :target_someone, :target,
                           :type_packing, :org_reception, :reg_name, :doctor_aid, :defect_skin, :org_inspect]
  end

end