# -*- encoding : utf-8 -*-

class Visitation < ActiveRecord::Base

  acts_as_paranoid

  belongs_to :donor
  belongs_to :org_address, inverse_of: :visitation_organization_address
  belongs_to :org_reception, inverse_of: :visitation_org_reception
  belongs_to :reception, inverse_of: :visitation_reception
  belongs_to :send_village, class_name: "Village", inverse_of: :visitation_send_village
  belongs_to :send_org, inverse_of: :visitation_send_organization
  belongs_to :send_dep, inverse_of: :visitation_send_department
  belongs_to :target, inverse_of: :visitation_target
  belongs_to :blood_group, inverse_of: :visitation_blood
  belongs_to :rh_factor, inverse_of: :visitation_rh
  belongs_to :country, inverse_of: :visitation_country
  belongs_to :region, inverse_of: :visitation_region
  belongs_to :district, inverse_of: :visitation_district
  belongs_to :village, inverse_of: :visitation_village
  belongs_to :control_blood, class_name: "BloodGroup", inverse_of: :visitation_control_blood
  belongs_to :rh_control, inverse_of: :visitation_rh_control
  belongs_to :reg_name, inverse_of: :visitation_reg_name
  belongs_to :doctor_skin, inverse_of: :visitation_doctor_skin
  belongs_to :doctor_therapist, inverse_of: :visitation_doctor_therapist
  belongs_to :defect_cause, inverse_of: :visitation_defect_cause

  attr_accessible :card_number, :reg_date, :code_org, :org_reception_id, :org_address_id, :reception_id,
                  :send_village_id, :send_org_id, :send_dep_id, :visit_date, :target_id, :type_payment, :blood_group_id,
                  :rh_factor_id, :donor_name, :gender, :birth_date, :age, :post_code, :country_id, :region_id,
                  :district_id, :type_village, :village_id, :address, :work, :job, :reg_name_id, :control_blood_id,
                  :rh_control_id, :ill_hepatitis, :ill_tb, :ill_syphilis, :ill_mal, :operation, :transfusion,
                  :infection, :dermis, :dermis_doctor, :doctor_skin_id, :pulse, :sys_pressure, :dias_pressure,
                  :allow_amount, :therapist_doctor, :doctor_therapist_id, :defect_cause_id

  validates :donor_id, inclusion: {in: proc {Donor.pluck(:id)}}
  validates :card_number, presence: true, length: {maximum: 30}, uniqueness: true
  validates :reg_date, presence: true
  validates :code_org, presence: true, numericality: {only_integer: true}, inclusion: {in: 1..9999999999}
  validates :org_reception_id, inclusion: {in: proc {OrgReception.pluck(:id)}, allow_blank: true}
  validates :org_address_id, inclusion: {in: proc {OrgAddress.pluck(:id)}, allow_blank: true}
  validates :reception_id, inclusion: {in: proc {Reception.pluck(:id)}}
  validates :send_village_id, inclusion: {in: proc {Village.pluck(:id)}, allow_blank: true}
  validates :send_org_id, inclusion: {in: proc {SendOrg.pluck(:id)}, allow_blank: true}
  validates :send_dep_id, inclusion: {in: proc {SendDep.pluck(:id)}, allow_blank: true}
  validates :visit_date, presence: true
  validates :target_id, inclusion: {in: proc {Target.pluck(:id)}, allow_blank: true}
  validates :type_payment, inclusion: {in: [true, false]}
  validates :blood_group_id, inclusion: {in: proc {BloodGroup.pluck(:id)}}
  validates :rh_factor_id, inclusion: {in: proc {RhFactor.pluck(:id)}}
  validates :donor_name, presence: true, length: {maximum: 100}
  validates :gender, inclusion: {in: [true, false]}
  validates :age, presence: true, numericality: {only_integer: true}, inclusion: {in: 1..999}
  validates :post_code, length: {maximum: 20}
  validates :country_id, inclusion: {in: proc {Country.pluck(:id)}, allow_blank: true}
  validates :region_id, inclusion: {in: proc {Region.pluck(:id)}, allow_blank: true}
  validates :district_id, inclusion: {in: proc {District.pluck(:id)}, allow_blank: true}
  validates :type_village, inclusion: {in: [true, false], allow_blank: true}
  validates :village_id, inclusion: {in: proc {Village.pluck(:id)}, allow_blank: true}
  validates :address, length: {maximum: 100}
  validates :work, length: {maximum: 100}
  validates :job, length: {maximum: 100}
  validates :reg_name_id, inclusion: {in: proc {RegName.pluck(:id)}}
  validates :control_blood_id, inclusion: {in: proc {BloodGroup.pluck(:id)}, allow_blank: true}
  validates :rh_control_id, inclusion: {in: proc {RhControl.pluck(:id)}, allow_blank: true}
  validates :ill_hepatitis, inclusion: {in: [true, false]}
  validates :ill_tb, inclusion: {in: [true, false]}
  validates :ill_syphilis, inclusion: {in: [true, false]}
  validates :ill_mal, inclusion: {in: [true, false]}
  validates :operation, inclusion: {in: [true, false]}
  validates :transfusion, inclusion: {in: [true, false]}
  validates :infection, inclusion: {in: [true, false]}
  validates :dermis, inclusion: {in: [true, false]}
  validates :dermis_doctor, inclusion: {in: [true, false]}
  validates :doctor_skin_id, inclusion: {in: proc {DoctorSkin.pluck(:id)}, allow_blank: true}
  validates :pulse, numericality: {only_integer: true, allow_blank: true},
                    inclusion: {in: 1..999, allow_blank: true}
  validates :sys_pressure, numericality: {only_integer: true, allow_blank: true},
                    inclusion: {in: 1..999, allow_blank: true}
  validates :dias_pressure, numericality: {only_integer: true, allow_blank: true},
                    inclusion: {in: 1..999, allow_blank: true}
  validates :allow_amount, numericality: {only_integer: true, allow_blank: true},
                    inclusion: {in: 0..999, allow_blank: true}
  validates :therapist_doctor, inclusion: {in: [true, false]}
  validates :doctor_therapist_id, inclusion: {in: proc {DoctorTherapist.pluck(:id)}, allow_blank: true}
  validates :defect_cause_id, inclusion: {in: proc {DefectCause.pluck(:id)}, allow_blank: true}

  validates_with DateTimeValidator, fields: [:reg_date, :visit_date, :birth_date]

  def name
    ("(" + [(self.donor.blank? ? I18n.t("donor.no_blank") : self.donor.name),
     (self.visit_date.blank? ? I18n.t("visitation.no_date_donation") : self.visit_date.to_date.strftime("%d-%m-%Y"))].join("/") + ")") unless self.id.blank?
  end

end