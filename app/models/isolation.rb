# -*- encoding : utf-8 -*-

class Isolation < ActiveRecord::Base

  acts_as_paranoid

  belongs_to :visit

  attr_accessible :plasm_ag_amount, :plasm_ag_bootle, :plasm_ag_store, :plasm_krio_amount, :plasm_krio_bootle,
                  :plasm_krio_store, :plasm_proc_amount, :plasm_proc_bootle, :plasm_proc_store, :plasm_ac_amount,
                  :plasm_ac_bootle, :plasm_ac_store, :defect_aids, :defect_syph, :defect_hep_c, :defect_hep_b,
                  :wr_defect_date, :rep_exam_date, :end_quar_date, :give_dispatch, :give_fraction, :give_store

  validates :visit_id, inclusion: {in: Visit.pluck(:id)}
  validates :plasm_ag_amount, numericality: {only_integer: true}, inclusion: {in: 0..999}
  validates :plasm_ag_bootle, length: {maximum: 30}
  validates :plasm_ag_store, length: {maximum: 30}
  validates :plasm_krio_amount, numericality: {only_integer: true}, inclusion: {in: 0..999}
  validates :plasm_krio_bootle, length: {maximum: 30}
  validates :plasm_krio_store, length: {maximum: 30}
  validates :plasm_proc_amount, numericality: {only_integer: true}, inclusion: {in: 0..999}
  validates :plasm_proc_bootle, length: {maximum: 30}
  validates :plasm_proc_store, length: {maximum: 30}
  validates :plasm_ac_amount, numericality: {only_integer: true}, inclusion: {in: 0..999}
  validates :plasm_ac_bootle, length: {maximum: 30}
  validates :plasm_ac_store, length: {maximum: 30}
  validates :defect_aids, inclusion: {in: [true, false]}
  validates :defect_syph, inclusion: {in: [true, false]}
  validates :defect_hep_c, inclusion: {in: [true, false]}
  validates :defect_hep_b, inclusion: {in: [true, false]}
  validates :wr_defect_date, presence: true
  validates :rep_exam_date, presence: true
  validates :end_quar_date, presence: true
  validates :give_dispatch, inclusion: {in: [true, false]}
  validates :give_fraction, inclusion: {in: [true, false]}
  validates :give_store, inclusion: {in: [true, false]}
  validates_with DateTimeValidator, fields: [:wr_defect_date, :rep_exam_date, :end_quar_date]

  def name
    self.visit.donor_name
  end

end