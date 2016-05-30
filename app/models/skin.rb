# -*- encoding : utf-8 -*-

class Skin < ActiveRecord::Base

  acts_as_paranoid

  belongs_to :country, inverse_of: :skin_country
  belongs_to :region, inverse_of: :skin_region
  belongs_to :district, inverse_of: :skin_district
  belongs_to :village, inverse_of: :skin_village
  belongs_to :defect_skin, inverse_of: :skin_defect_skin
  belongs_to :reg_name, inverse_of: :skin_reg_name
  belongs_to :defect_org, inverse_of: :skin_defect_org

  attr_accessible :card_number, :first_name, :middle_name, :last_name, :birth_date, :post_code, :country_id, :region_id,
                  :district_id, :village_id, :address, :defect_skin_id, :date_dermis_begin, :date_dermis_end,
                  :reg_name_id, :defect_org_id

  validates :card_number, presence: true, numericality: {only_integer: true}, inclusion: {in: 1..9999999999999999},
            uniqueness: true
  validates :first_name, presence: true, length: {maximum: 30}
  validates :middle_name, presence: true, length: {maximum: 30}
  validates :last_name, presence: true, length: {maximum: 30}
  validates :post_code, length: {maximum: 20}
  validates :country_id, inclusion: {in: proc {Country.pluck(:id)}, allow_blank: true}
  validates :region_id, inclusion: {in: proc {Region.pluck(:id)}, allow_blank: true}
  validates :district_id, inclusion: {in: proc {District.pluck(:id)}, allow_blank: true}
  validates :village_id, inclusion: {in: proc {Village.pluck(:id)}, allow_blank: true}
  validates :address, length: {maximum: 100}
  validates :defect_skin_id, inclusion: {in: proc {DefectSkin.pluck(:id)}}
  validates :defect_org_id, inclusion: {in: proc {DefectOrg.pluck(:id)}}
  validates :date_dermis_begin, presence: true
  validates :reg_name_id, inclusion: {in: proc {RegName.pluck(:id)}}
  validates_with DateTimeValidator, fields: [:birth_date, :date_dermis_begin, :date_dermis_end]

  def self.max_card_number
    number = Skin.with_deleted.maximum(:card_number)
    number.nil? ? 0 : number
  end

  def name
    [(self.last_name.blank? ? I18n.t('skin.no_last_name') : self.last_name),
     (self.first_name.blank? ? I18n.t('skin.no_first_name') : self.first_name),
     (self.middle_name.blank? ? '' : self.middle_name)].join(' ') unless self.id.blank?
  end

end
