# -*- encoding : utf-8 -*-

class DonorDefect < ActiveRecord::Base

  acts_as_paranoid

  belongs_to :donor
  belongs_to :defect_org, inverse_of: :donor_defect_org
  belongs_to :defect_cause, inverse_of: :donor_defect_cause

  attr_accessible :defect_org_id, :defect_date, :defect_end, :defect_cause_id

  validates :donor_id, inclusion: {in: proc {Donor.pluck(:id)}, on: :update}
  validates :defect_org_id, inclusion: {in: proc {DefectOrg.pluck(:id)}}
  validates :defect_cause_id, inclusion: {in: proc {DefectCause.pluck(:id)}}
  validates_with DateTimeValidator, fields: [:defect_date, :defect_end]

  def name
    ("(" + [(self.donor.blank? ? I18n.t("donor.no_blank") : self.donor.name),
     (self.defect_cause.blank? ? I18n.t("donor_defects.no_defect_cause") : self.defect_cause.value_name)].join("/") + ")") unless self.id.blank?
  end

end