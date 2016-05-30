# -*- encoding : utf-8 -*-

class Donor < ActiveRecord::Base

  acts_as_paranoid

  has_many :donor_documents, dependent: :destroy
  has_many :donor_defects, dependent: :destroy
  has_many :visits, order: 'date_donation DESC', dependent: :destroy
  has_many :visitations, order: 'visit_date DESC', dependent: :destroy

  has_many :villages_send, through: :visits, source: :send_village
  has_many :deps_send, through: :visits, source: :send_dep
  has_many :orgs_send, through: :visits, source: :send_org
  has_many :someones_target, through: :visits, source: :target_someone
  has_many :ones_target, through: :visits, source: :target
  has_many :causes_defect, through: :visits, source: :defect_cause

  belongs_to :cat_donor, inverse_of: :donor_category
  belongs_to :org_donate, inverse_of: :donor_organization
  belongs_to :doctor_chief, inverse_of: :donor_chief
  belongs_to :blood_group, inverse_of: :donor_blood
  belongs_to :rh_factor, inverse_of: :donor_rh
  belongs_to :hla_factor, inverse_of: :donor_hla
  belongs_to :country, inverse_of: :donor_country
  belongs_to :region, inverse_of: :donor_region
  belongs_to :district, inverse_of: :donor_district
  belongs_to :village, inverse_of: :donor_village
  belongs_to :reg_name, inverse_of: :donor_reg_name

  # delegate :type_donation, to: :visits

  attr_accessible :card_number, :code_org, :cat_donor_id, :org_donate_id, :visit_date, :reg_date, :reg_name_id,
                  :doctor_chief_id, :blood_group_id, :rh_factor_id, :hla_factor_id, :first_name, :middle_name,
                  :last_name, :gender, :birth_date, :post_code, :country_id, :region_id, :district_id, :type_village,
                  :village_id, :address, :tel_home, :work, :job, :tel_work
  attr_accessible :donor_document_ids
  attr_accessible :donor_defect_ids
  attr_accessible :visit_ids
  attr_accessible :visitation_ids

  validates :card_number, presence: true, numericality: {only_integer: true}, inclusion: {in: 1..9999999999999999},
                          uniqueness: true
  validates :code_org, presence: true, numericality: {only_integer: true}, inclusion: {in: 1..9999999999}
  validates :cat_donor_id, inclusion: {in: proc {CatDonor.pluck(:id)}}
  validates :org_donate_id, inclusion: {in: proc {OrgDonate.pluck(:id)}}
  validates :visit_date, presence: true
  validates :reg_date, presence: true
  validates :reg_name_id, inclusion: {in: proc {RegName.pluck(:id)}}
  validates :doctor_chief_id, inclusion: {in: proc {DoctorChief.pluck(:id)}}
  validates :blood_group_id, inclusion: {in: proc {BloodGroup.pluck(:id)}}
  validates :rh_factor_id, inclusion: {in: proc {RhFactor.pluck(:id)}}
  validates :hla_factor_id, inclusion: {in: proc {HlaFactor.pluck(:id)}, allow_blank: true}
  validates :first_name, presence: true, length: {maximum: 30}
  validates :middle_name, presence: true, length: {maximum: 30}
  validates :last_name, presence: true, length: {maximum: 30}
  validates :gender, inclusion: {in: [true, false]}
  validates :post_code, length: {maximum: 20}
  validates :country_id, inclusion: {in: proc {Country.pluck(:id)}, allow_blank: true}
  validates :region_id, inclusion: {in: proc {Region.pluck(:id)}, allow_blank: true}
  validates :district_id, inclusion: {in: proc {District.pluck(:id)}, allow_blank: true}
  validates :type_village, inclusion: {in: [true, false], allow_blank: true}
  validates :village_id, inclusion: {in: proc {Village.pluck(:id)}, allow_blank: true}
  validates :address, length: {maximum: 100}
  validates :tel_home, length: {maximum: 50}
  validates :work, length: {maximum: 100}
  validates :job, length: {maximum: 100}
  validates :tel_work, length: {maximum: 50}
  validates_with DateTimeValidator, fields: [:reg_date, :visit_date, :birth_date]

  def self.max_card_number
    number = Donor.with_deleted.maximum(:card_number)
    number.nil? ? 0 : number
  end

  def name
    [(self.last_name.blank? ? I18n.t('donor.no_last_name') : self.last_name),
     (self.first_name.blank? ? I18n.t('donor.no_first_name') : self.first_name),
     (self.middle_name.blank? ? '' : self.middle_name)].join(' ') unless self.id.blank?
  end

  def last_visit_day
    visit = Visit.where(donor_id: self.id).order(:date_donation).last
    if visit.nil?
      0
    else
      between_day = Time.now.to_date - visit.date_donation.to_date
      (between_day.ceil + (between_day/1460).ceil)
    end
  end

  # def type_donation
  #
  # end

end