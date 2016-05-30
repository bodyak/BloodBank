# -*- encoding : utf-8 -*-

class DonorDocument < ActiveRecord::Base

  acts_as_paranoid

  belongs_to :donor
  belongs_to :doc, inverse_of: :donor_documents

  attr_accessible :donor_id, :doc_id, :serial_doc, :number_doc, :date_doc, :org_doc

  validates :donor_id, inclusion: {in: proc {Donor.pluck(:id)}, on: :update}
  validates :doc_id, inclusion: {in: proc {Doc.pluck(:id)}}
  validates :serial_doc, presence: true, length: {maximum: 30}
  validates :number_doc, presence: true, length: {maximum: 30}
  validates :org_doc, length: {maximum: 100}
  validates_with DateTimeValidator, fields: [:date_doc]

  def name
    ("(" + [(self.donor.blank? ? I18n.t("donor.no_blank") : self.donor.name),
     (self.doc.blank? ? I18n.t("donor_documents.no_doc") : self.doc.value_name),
     (self.serial_doc.blank? ? I18n.t("donor_documents.no_serial_doc") : self.serial_doc),
     (self.number_doc.blank? ? I18n.t("donor_documents.no_number_doc") : self.number_doc),
     (self.date_doc.blank? ? I18n.t("donor_documents.no_date_doc") : self.date_doc.to_date.strftime("%d-%m-%Y"))].join("/") + ")") unless self.id.blank?
  end

end