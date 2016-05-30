# -*- encoding : utf-8 -*-

require "migration_helper"

class ImportInformationForVisit < ActiveRecord::Migration

  include MigrationHelper

  def self.up
    donations = Card.find_by_sql("SELECT donors.id donor_id, cards.*
                                  FROM cards, card_links, donors
                                  WHERE cards.cdoc = card_links.cdoc AND card_links.curr_cdoc = donors.card_number
                                  ORDER BY donors.id")
    donations.each do |donation|
      Visit.create({:donor_id            => donation.read_attribute_before_type_cast("donor_id"),
                    :card_number         => donation.fnum_84,
                    :reg_date            => rewrite_date(donation.fnum_42),
                    :code_org            => rewrite_int(donation.fnum_91),
                    :org_reception_id    => donation.fnum_19,
                    :org_address_id      => donation.fnum_40,
                    :reception_id        => donation.fnum_66,
                    :send_village_id     => donation.fnum_95,
                    :send_org_id         => donation.fnum_67,
                    :send_dep_id         => donation.fnum_96,
                    :visit_date          => rewrite_date(donation.fnum_4),
                    :target_id           => donation.fnum_87,
                    :type_payment        => rewrite_logical(donation.fnum_83, 'без оплати', 'за оплату'),
                    :target_someone_id   => donation.fnum_92,
                    :blood_for_id        => donation.fnum_26,
                    :type_donation       => donation.fnum_48,
                    :blood_group_id      => donation.fnum_43,
                    :rh_factor_id        => donation.fnum_51,
                    :donor_name          => donation.fnum_1,
                    :gender              => rewrite_logical(donation.fnum_2, 'чоловіча', 'жіноча'),
                    :birth_date          => rewrite_date(donation.fnum_64),
                    :age                 => rewrite_int(donation.fnum_3),
                    :post_code           => donation.fnum_7,
                    :country_id          => donation.fnum_5,
                    :region_id           => donation.fnum_8,
                    :district_id         => donation.fnum_9,
                    :type_village        => rewrite_logical(donation.fnum_14, 'місті', 'селі'),
                    :village_id          => donation.fnum_10,
                    :address             => donation.fnum_13,
                    :work                => donation.fnum_15,
                    :job                 => donation.fnum_16,
                    :reg_name_id         => donation.fnum_31,
                    :control_blood_id    => donation.fnum_23,
                    :rh_control_id       => donation.fnum_28,
                    :analysis_date       => rewrite_date(donation.fnum_34),
                    :doctor_test_id      => donation.fnum_35,
                    :previous_date       => rewrite_date(donation.fnum_11),
                    :infection           => rewrite_logical(donation.fnum_58),
                    :dermis              => rewrite_logical(donation.fnum_90),
                    :dermis_doctor       => rewrite_logical(donation.fnum_27, 'так', 'ні'),
                    :doctor_skin_id      => donation.fnum_22,
                    :pulse               => rewrite_int(donation.fnum_24),
                    :sys_pressure        => rewrite_int(donation.fnum_25.to_s.partition(/\//)[0]),
                    :dias_pressure       => rewrite_int(donation.fnum_25.to_s.partition(/\//)[2]),
                    :allow_amount        => rewrite_int(donation.fnum_61),
                    :therapist_doctor    => rewrite_logical(donation.fnum_21, 'так', 'ні'),
                    :doctor_therapist_id => donation.fnum_29,
                    :defect_cause_id     => donation.fnum_12,

                    :date_donation       => rewrite_date(donation.fnum_50),
                    :doctor_donation_id  => donation.fnum_72,
                    :donation_mode_id    => donation.fnum_65,
                    :donation_type_id    => donation.fnum_81,
                    :amount_probe        => rewrite_int(donation.fnum_44),
                    :amount_dose         => rewrite_int(donation.fnum_46),
                    :type_packing_id     => donation.fnum_73,
                    :bottle_number       => donation.fnum_47,
                    :inspect_bilirubin   => rewrite_number(donation.fnum_55, 'високий', 'нормальний'),
                    :inspect_alt         => rewrite_number(donation.fnum_56, 'високий', 'нормальний'),
                    :inspect_syphilis    => rewrite_logical(donation.fnum_33, 'так', 'ні'),
                    :date_syphilis       => rewrite_date(donation.fnum_63),
                    :inspect_hep_c       => rewrite_logical(donation.fnum_53, 'так', 'ні'),
                    :date_hep_c          => rewrite_date(donation.fnum_79),
                    :inspect_hep_b       => rewrite_logical(donation.fnum_54, 'так', 'ні'),
                    :date_hep_b          => rewrite_date(donation.fnum_85),
                    :inspect_aids        => rewrite_logical(donation.fnum_57, 'так', 'ні'),
                    :date_aids           => rewrite_date(donation.fnum_86)},

                   :without_protection => true)
      commit_db_transaction
    end
  end

  def self.down
    Visit.delete_all
  end

end