# -*- encoding : utf-8 -*-

require "migration_helper"

class ImportInformationForDonor < ActiveRecord::Migration

  include MigrationHelper

  def self.up
    donors = CardDonor.find_by_sql("SELECT card_donors.*
                                    FROM card_donors, documents
                                    WHERE card_donors.cdoc = documents.doc_code AND documents.category_code = 2
                                     AND card_donors.cdoc IN (SELECT DISTINCT cdoc FROM card_vals)")
    donors.each do |donor|
      Donor.create({:card_number     => donor.cdoc,
                    :code_org        => rewrite_int(donor.fnum_60),
                    :cat_donor_id    => donor.fnum_7,
                    :org_donate_id   => donor.fnum_1,
                    :visit_date      => rewrite_date(donor.fnum_2),
                    :reg_date        => rewrite_date(donor.fnum_2),
                    :reg_name_id     => donor.fnum_39,
                    :doctor_chief_id => donor.fnum_41,
                    :blood_group_id  => donor.fnum_22,
                    :rh_factor_id    => donor.fnum_23,
                    :hla_factor_id   => donor.fnum_24,
                    :first_name      => donor.fnum_4,
                    :middle_name     => donor.fnum_5,
                    :last_name       => donor.fnum_3,
                    :gender          => rewrite_logical(donor.fnum_6, 'чоловіча', 'жіноча'),
                    :birth_date      => rewrite_date(donor.fnum_8),
                    :post_code       => donor.fnum_11,
                    :country_id      => donor.fnum_12,
                    :region_id       => donor.fnum_13,
                    :district_id     => donor.fnum_14,
                    :type_village    => rewrite_logical(donor.fnum_17, 'місті', 'селі'),
                    :village_id      => donor.fnum_15,
                    :address         => donor.fnum_16,
                    :tel_home        => donor.fnum_20,
                    :work            => donor.fnum_18,
                    :job             => donor.fnum_19,
                    :tel_work        => donor.fnum_21},
                   :without_protection => true)
      commit_db_transaction
      id_donor = Donor.last.id
      doc_values = [[donor.fnum_32, donor.fnum_9, donor.fnum_10, donor.fnum_71, donor.fnum_74],
                    [donor.fnum_40, donor.fnum_50, donor.fnum_51, donor.fnum_72, donor.fnum_75]]
      doc_values.each do |doc_value|
        doc_create(id_donor, doc_value) unless (doc_value - [nil]).empty?
      end
      def_values = [donor.fnum_26, donor.fnum_27, donor.fnum_25]
      def_create(id_donor, def_values) unless (def_values - [nil]).empty?
    end
    commit_db_transaction
    DonorDocument.where(:serial_doc => 'Х').delete_all
    DonorDocument.where(:serial_doc => 'ХХ').delete_all
    DonorDocument.where(:serial_doc => 'ХХХ').delete_all
    DonorDocument.where(:doc_id => nil, :serial_doc => nil).delete_all
    DonorDocument.where(:doc_id => nil, :number_doc => nil).delete_all
  end

  def self.down
    Donor.delete_all
    DonorDocument.delete_all
    DonorDefect.delete_all
  end

  def doc_create(id_donor, doc_value)
    DonorDocument.create({:donor_id   => id_donor,
                          :doc_id     => doc_value[0],
                          :serial_doc => doc_value[1],
                          :number_doc => rewrite_int(doc_value[2]),
                          :date_doc   => rewrite_date(doc_value[3]),
                          :org_doc    => doc_value[4]},
                         :without_protection => true)
  end

  def def_create(id_donor, def_value)
    DonorDefect.create({:donor_id        => id_donor,
                        :defect_org_id   => def_value[0],
                        :defect_date     => rewrite_date(def_value[1]),
                        :defect_cause_id => def_value[2]},
                       :without_protection => true)
  end

end