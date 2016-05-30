# -*- encoding : utf-8 -*-

class Visit < ActiveRecord::Base

  acts_as_paranoid

  has_many :isolations, dependent: :destroy

  belongs_to :donor
  belongs_to :org_address, inverse_of: :visit_organization_address
  belongs_to :org_reception, inverse_of: :visit_org_reception
  belongs_to :reception, inverse_of: :visit_reception
  belongs_to :send_village, class_name: "Village", inverse_of: :visit_send_village
  belongs_to :send_org, inverse_of: :visit_send_organization
  belongs_to :send_dep, inverse_of: :visit_send_department
  belongs_to :target, inverse_of: :visit_target
  belongs_to :target_someone, inverse_of: :visit_target_someone
  belongs_to :blood_for, inverse_of: :visit_blood_for
  belongs_to :blood_group, inverse_of: :visit_blood
  belongs_to :rh_factor, inverse_of: :visit_rh
  belongs_to :country, inverse_of: :visit_country
  belongs_to :region, inverse_of: :visit_region
  belongs_to :district, inverse_of: :visit_district
  belongs_to :village, inverse_of: :visit_village
  belongs_to :control_blood, class_name: "BloodGroup", inverse_of: :visit_control_blood
  belongs_to :rh_control, inverse_of: :visit_rh_control
  belongs_to :doctor_test, inverse_of: :visit_doctor_test
  belongs_to :doctor_aid, inverse_of: :visit_doctor_aid
  belongs_to :doctor_skin, inverse_of: :visit_doctor_skin
  belongs_to :doctor_therapist, inverse_of: :visit_doctor_therapist
  belongs_to :defect_cause, inverse_of: :visit_defect_cause
  belongs_to :doctor_donation, inverse_of: :visit_doctor_donation
  belongs_to :donation_mode, inverse_of: :visit_donation_mode
  belongs_to :donation_type, inverse_of: :visit_donation_type
  belongs_to :type_packing, inverse_of: :visit_type_packing
  belongs_to :reg_name, inverse_of: :visit_reg_name
  belongs_to :org_syphilis, class_name: "OrgInspect", inverse_of: :visit_inspect_syphilis
  belongs_to :org_hep_c, class_name: "OrgInspect", inverse_of: :visit_inspect_hep_c
  belongs_to :org_hep_b, class_name: "OrgInspect", inverse_of: :visit_inspect_hep_b
  belongs_to :org_aids, class_name: "OrgInspect", inverse_of: :visit_inspect_aids

  attr_accessible :card_number, :reg_date, :code_org, :org_reception_id, :org_address_id, :reception_id,
                  :send_village_id, :send_org_id, :send_dep_id, :visit_date, :target_id, :type_payment,
                  :target_someone_id, :blood_for_id, :type_donation, :blood_group_id, :rh_factor_id, :donor_name,
                  :gender, :birth_date, :age, :post_code, :country_id, :region_id, :district_id, :type_village,
                  :village_id, :address, :work, :job, :reg_name_id, :control_blood_id, :rh_control_id, :hbs,
                  :analysis_date, :doctor_test_id, :doctor_aid_id, :previous_date, :previous_place, :ill_hepatitis,
                  :ill_tb, :ill_syphilis, :ill_mal, :operation, :transfusion, :infection, :dermis, :dermis_doctor,
                  :doctor_skin_id, :pulse, :sys_pressure, :dias_pressure, :allow_amount, :therapist_doctor,
                  :doctor_therapist_id, :defect_cause_id, :date_donation, :doctor_donation_id, :donation_mode_id,
                  :donation_type_id, :amount_probe, :amount_dose, :type_packing_id, :bottle_number, :inspect_bilirubin,
                  :inspect_alt, :inspect_syphilis, :date_syphilis, :inspect_hep_c, :date_hep_c, :inspect_hep_b,
                  :date_hep_b, :inspect_aids, :date_aids, :post_inspect_syphilis, :post_date_syphilis, :org_syphilis_id,
                  :post_inspect_hep_c, :post_date_hep_c, :org_hep_c_id, :post_inspect_hep_b, :post_date_hep_b,
                  :org_hep_b_id, :post_inspect_aids, :post_date_aids, :org_aids_id
  attr_accessible :isolation_ids

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
  validates :target_id, inclusion: {in: proc {Target.pluck(:id)}}
  validates :type_payment, inclusion: {in: [true, false]}
  validates :target_someone_id, inclusion: {in: proc {TargetSomeone.pluck(:id)}, allow_blank: true}
  validates :blood_for_id, inclusion: {in: proc {BloodFor.pluck(:id)}}
  validates :type_donation, length: {maximum: 50}
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
  validates :control_blood_id, inclusion: {in: proc {BloodGroup.pluck(:id)}}
  validates :rh_control_id, inclusion: {in: proc {RhControl.pluck(:id)}, allow_blank: true}
  validates :hbs, presence: true, numericality: {only_integer: true}, inclusion: {in: 0..99999}
  validates :analysis_date, presence: true
  validates :doctor_test_id, inclusion: {in: proc {DoctorTest.pluck(:id)}}
  validates :doctor_aid_id, inclusion: {in: proc {DoctorAid.pluck(:id)}}
  validates :previous_place, length: {maximum: 254}
  validates :ill_hepatitis, inclusion: {in: [true, false]}
  validates :ill_tb, inclusion: {in: [true, false]}
  validates :ill_syphilis, inclusion: {in: [true, false]}
  validates :ill_mal, inclusion: {in: [true, false]}
  validates :operation, inclusion: {in: [true, false]}
  validates :transfusion, inclusion: {in: [true, false]}
  validates :infection, inclusion: {in: [true, false]}
  validates :dermis, inclusion: {in: [true, false]}
  validates :dermis_doctor, inclusion: {in: [true, false]}
  validates :doctor_skin_id, inclusion: {in: proc {DoctorSkin.pluck(:id)}}
  validates :pulse, numericality: {only_integer: true, allow_blank: true},
                    inclusion: {in: 1..999, allow_blank: true}
  validates :sys_pressure, numericality: {only_integer: true, allow_blank: true},
                    inclusion: {in: 1..999, allow_blank: true}
  validates :dias_pressure, numericality: {only_integer: true, allow_blank: true},
                    inclusion: {in: 1..999, allow_blank: true}
  validates :allow_amount, numericality: {only_integer: true}, inclusion: {in: 0..999}
  validates :therapist_doctor, inclusion: {in: [true, false]}
  validates :doctor_therapist_id, inclusion: {in: proc {DoctorTherapist.pluck(:id)}}
  validates :defect_cause_id, inclusion: {in: proc {DefectCause.pluck(:id)}, allow_blank: true}
  validates :date_donation, presence: true
  validates :doctor_donation_id, inclusion: {in: proc {DoctorDonation.pluck(:id)}}
  validates :donation_mode_id, inclusion: {in: proc {DonationMode.pluck(:id)}}
  validates :donation_type_id, inclusion: {in: proc {DonationType.pluck(:id)}}
  validates :amount_probe, presence: true, numericality: {only_integer: true}, inclusion: {in: 0..999}
  validates :amount_dose, presence: true, numericality: {only_integer: true}, inclusion: {in: 0..999}
  validates :type_packing_id, inclusion: {in: proc {TypePacking.pluck(:id)}}
  validates :bottle_number, presence: true, length: {maximum: 30}
  validates :inspect_bilirubin, presence: true, length: {maximum: 10}
  validates :inspect_alt, presence: true, length: {maximum: 10}
  validates :inspect_syphilis, presence: true, numericality: {only_integer: true}, inclusion: {in: 0..2}
  validates :date_syphilis, presence: true
  validates :inspect_hep_c, presence: true, numericality: {only_integer: true}, inclusion: {in: 0..2}
  validates :date_hep_c, presence: true
  validates :inspect_hep_b, presence: true, numericality: {only_integer: true}, inclusion: {in: 0..2}
  validates :date_hep_b, presence: true
  validates :inspect_aids, presence: true, numericality: {only_integer: true}, inclusion: {in: 0..2}
  validates :date_aids, presence: true
  validates :post_inspect_syphilis, inclusion: {in: [true, false], allow_blank: true}
  validates :org_syphilis_id, inclusion: {in: proc {OrgInspect.pluck(:id)}, allow_blank: true}
  validates :post_inspect_hep_c, inclusion: {in: [true, false], allow_blank: true}
  validates :org_hep_c_id, inclusion: {in: proc {OrgInspect.pluck(:id)}, allow_blank: true}
  validates :post_inspect_hep_b, inclusion: {in: [true, false], allow_blank: true}
  validates :org_hep_b_id, inclusion: {in: proc {OrgInspect.pluck(:id)}, allow_blank: true}
  validates :post_inspect_aids, inclusion: {in: [true, false], allow_blank: true}
  validates :org_aids_id, inclusion: {in: proc {OrgInspect.pluck(:id)}, allow_blank: true}
  validates_with DateTimeValidator, fields: [:reg_date, :visit_date, :date_donation, :analysis_date, :previous_date,
                                             :birth_date, :date_syphilis, :date_hep_c, :date_hep_b, :date_aids,
                                             :post_date_syphilis, :post_date_hep_c, :post_date_hep_b, :post_date_aids]

  def name
    ('(' + [(self.donor.blank? ? I18n.t('donor.no_blank') : self.donor.name),
     (self.date_donation.blank? ? I18n.t('visit.no_date_donation') : self.date_donation.to_date.strftime('%d-%m-%Y')),
     (self.defect_cause.blank? ? I18n.t('visit.no_defect_cause') : self.defect_cause.name)].join('/') + ')') unless self.id.blank?
  end

end