# -*- encoding : utf-8 -*-

class VisitsController < ApplicationController

  active_scaffold :visit do |config|
    config.actions = [:create, :list, :show, :update, :delete, :nested, :subform]

    config.columns = [:card_number, :reg_date, :code_org, :org_reception, :org_address, :reception, :send_village,
                      :send_org, :send_dep, :visit_date, :target, :type_payment, :target_someone, :blood_for,
                      :type_donation, :blood_group, :rh_factor, :donor_name, :gender, :birth_date, :age, :post_code,
                      :country, :region, :district, :type_village, :village, :address, :work, :job, :reg_name,
                      :control_blood, :rh_control, :hbs, :analysis_date, :doctor_test, :doctor_aid, :previous_date,
                      :previous_place, :ill_hepatitis, :ill_tb, :ill_syphilis, :ill_mal, :operation, :transfusion,
                      :infection, :dermis, :dermis_doctor, :doctor_skin, :pulse, :sys_pressure, :dias_pressure,
                      :allow_amount, :therapist_doctor, :doctor_therapist, :defect_cause, :date_donation,
                      :doctor_donation, :donation_mode, :donation_type, :amount_probe, :amount_dose, :type_packing,
                      :bottle_number, :inspect_bilirubin, :inspect_alt, :inspect_syphilis, :date_syphilis,
                      :inspect_hep_c, :date_hep_c, :inspect_hep_b, :date_hep_b, :inspect_aids, :date_aids,
                      :post_inspect_syphilis, :post_date_syphilis, :org_syphilis, :post_inspect_hep_c, :post_date_hep_c,
                      :org_hep_c, :post_inspect_hep_b, :post_date_hep_b, :org_hep_b, :post_inspect_aids,
                      :post_date_aids, :org_aids, :isolations]

    config.list.label = I18n.t('activerecord.models.visit')
    config.list.columns = [:donor_name, :date_donation, :blood_for, :type_payment, :defect_cause, :amount_dose]
    config.list.per_page = 20
    config.list.empty_field_text = ''

    config.show.columns.exclude :isolations

    config.create.link.label = I18n.t('visit.create_link')
    config.create.label = I18n.t('visit.create')
    config.create.columns.exclude :card_number, :code_org, :isolations, :post_inspect_syphilis, :post_date_syphilis,
                                  :org_syphilis, :post_inspect_hep_c, :post_date_hep_c, :org_hep_c, :post_inspect_hep_b,
                                  :post_date_hep_b, :org_hep_b, :post_inspect_aids, :post_date_aids, :org_aids

    config.nested.add_link(:isolations, label: I18n.t('activerecord.models.isolation'))

    config.update.columns.exclude :card_number, :code_org, :isolations

    config.columns[:isolations].label = I18n.t('activerecord.models.isolation')

    config.columns[:card_number].label = I18n.t('activerecord.attributes.visit.card_number')

    config.columns[:reg_date].label = I18n.t('activerecord.attributes.visit.reg_date')
    config.columns[:reg_date].options = {size: 10, maxlength: 10}
    config.columns[:reg_date].required = true

    config.columns[:code_org].label = I18n.t('activerecord.attributes.visit.code_org')

    config.columns[:org_reception].label = I18n.t('activerecord.attributes.visit.org_reception_id')
    config.columns[:org_reception].form_ui = :record_select

    config.columns[:org_address].label = I18n.t('activerecord.attributes.visit.org_address_id')
    config.columns[:org_address].form_ui = :record_select

    config.columns[:reception].label = I18n.t('activerecord.attributes.visit.reception_id')
    config.columns[:reception].form_ui = :record_select
    config.columns[:reception].required = true

    config.columns[:send_village].label = I18n.t('activerecord.attributes.visit.send_village_id')
    config.columns[:send_village].form_ui = :record_select

    config.columns[:send_org].label = I18n.t('activerecord.attributes.visit.send_org_id')
    config.columns[:send_org].form_ui = :record_select

    config.columns[:send_dep].label = I18n.t('activerecord.attributes.visit.send_dep_id')
    config.columns[:send_dep].form_ui = :record_select

    config.columns[:visit_date].label = I18n.t('activerecord.attributes.visit.visit_date')
    config.columns[:visit_date].options = {size: 10, maxlength: 10}
    config.columns[:visit_date].required = true

    config.columns[:target].label = I18n.t('activerecord.attributes.visit.target_id')
    config.columns[:target].form_ui = :record_select
    config.columns[:target].required = true

    config.columns[:type_payment].label = I18n.t('activerecord.attributes.visit.type_payment')
    config.columns[:type_payment].form_ui = :select
    config.columns[:type_payment].options = {options: [['', ''],
                                                       [I18n.t('for_select.payment.plus'), 'true'],
                                                       [I18n.t('for_select.payment.minus'), 'false']]}
    config.columns[:type_payment].required = true

    config.columns[:target_someone].label = I18n.t('activerecord.attributes.visit.target_someone_id')
    config.columns[:target_someone].form_ui = :record_select

    config.columns[:blood_for].label = I18n.t('activerecord.attributes.visit.blood_for_id')
    config.columns[:blood_for].clear_link
    config.columns[:blood_for].form_ui = :record_select
    config.columns[:blood_for].required = true

    config.columns[:type_donation].label = I18n.t('activerecord.attributes.visit.type_donation')
    config.columns[:type_donation].form_ui = :select
    config.columns[:type_donation].options = {options: VISIT}
    config.columns[:type_donation].required = true

    config.columns[:blood_group].label = I18n.t('activerecord.attributes.visit.blood_group_id')
    config.columns[:blood_group].form_ui = :record_select
    config.columns[:blood_group].required = true

    config.columns[:rh_factor].label = I18n.t('activerecord.attributes.visit.rh_factor_id')
    config.columns[:rh_factor].form_ui = :record_select
    config.columns[:rh_factor].required = true

    config.columns[:donor_name].label = I18n.t('activerecord.attributes.visit.donor_name')
    config.columns[:donor_name].sort = false
    config.columns[:donor_name].required = true
    config.columns[:donor_name].options = {maxlength: 100}

    config.columns[:gender].label = I18n.t('activerecord.attributes.visit.gender')
    config.columns[:gender].form_ui = :select
    config.columns[:gender].options = {options: [['', ''],
                                                 [I18n.t('for_select.gender.man'), 'true'],
                                                 [I18n.t('for_select.gender.woman'), 'false']]}
    config.columns[:gender].required = true

    config.columns[:birth_date].label = I18n.t('activerecord.attributes.visit.birth_date')
    config.columns[:birth_date].options = {size: 10, maxlength: 10}

    config.columns[:age].label = I18n.t('activerecord.attributes.visit.age')
    config.columns[:age].options = {maxlength: 3, size: 3}

    config.columns[:post_code].label = I18n.t('activerecord.attributes.visit.post_code')
    config.columns[:post_code].options = {maxlength: 20}

    config.columns[:country].label = I18n.t('activerecord.attributes.visit.country_id')
    config.columns[:country].form_ui = :record_select

    config.columns[:region].label = I18n.t('activerecord.attributes.visit.region_id')
    config.columns[:region].form_ui = :record_select

    config.columns[:district].label = I18n.t('activerecord.attributes.visit.district_id')
    config.columns[:district].form_ui = :record_select

    config.columns[:type_village].label = I18n.t('activerecord.attributes.visit.type_village')
    config.columns[:type_village].form_ui = :select
    config.columns[:type_village].options = {options: [['', ''],
                                                       [I18n.t('for_select.type_village.town'), 'true'],
                                                       [I18n.t('for_select.type_village.village'), 'false']]}

    config.columns[:village].label = I18n.t('activerecord.attributes.visit.village_id')
    config.columns[:village].form_ui = :record_select

    config.columns[:address].label = I18n.t('activerecord.attributes.visit.address')
    config.columns[:address].options = {maxlength: 100}

    config.columns[:work].label = I18n.t('activerecord.attributes.visit.work')
    config.columns[:work].options = {maxlength: 100}

    config.columns[:job].label = I18n.t('activerecord.attributes.visit.job')
    config.columns[:job].options = {maxlength: 100}

    config.columns[:reg_name].label = I18n.t('activerecord.attributes.visit.reg_name_id')
    config.columns[:reg_name].form_ui = :record_select
    config.columns[:reg_name].required = true

    config.columns[:control_blood].label = I18n.t('activerecord.attributes.visit.control_blood_id')
    config.columns[:control_blood].form_ui = :record_select
    config.columns[:control_blood].required = true

    config.columns[:rh_control].label = I18n.t('activerecord.attributes.visit.rh_control_id')
    config.columns[:rh_control].form_ui = :record_select

    config.columns[:hbs].label = I18n.t('activerecord.attributes.visit.hbs')
    config.columns[:hbs].options = {size: 5, maxlength: 5}
    config.columns[:hbs].required = true

    config.columns[:analysis_date].label = I18n.t('activerecord.attributes.visit.analysis_date')
    config.columns[:analysis_date].options = {size: 10, maxlength: 10}
    config.columns[:analysis_date].required = true

    config.columns[:doctor_test].label = I18n.t('activerecord.attributes.visit.doctor_test_id')
    config.columns[:doctor_test].form_ui = :record_select
    config.columns[:doctor_test].required = true

    config.columns[:doctor_aid].label = I18n.t('activerecord.attributes.visit.doctor_aid_id')
    config.columns[:doctor_aid].form_ui = :record_select
    config.columns[:doctor_aid].required = true

    config.columns[:previous_date].label = I18n.t('activerecord.attributes.visit.previous_date')
    config.columns[:previous_date].options = {size: 10, maxlength: 10}

    config.columns[:previous_place].label = I18n.t('activerecord.attributes.visit.previous_place')
    config.columns[:previous_place].options = {maxlength: 254}

    config.columns[:ill_hepatitis].label = I18n.t('activerecord.attributes.visit.ill_hepatitis')
    config.columns[:ill_hepatitis].form_ui = :select
    config.columns[:ill_hepatitis].options = {options: [['', ''],
                                                        [I18n.t('for_select.sick.minus'), 'false'],
                                                        [I18n.t('for_select.sick.plus'), 'true']]}
    config.columns[:ill_hepatitis].required = true

    config.columns[:ill_tb].label = I18n.t('activerecord.attributes.visit.ill_tb')
    config.columns[:ill_tb].form_ui = :select
    config.columns[:ill_tb].options = {options: [['', ''],
                                                 [I18n.t('for_select.sick.minus'), 'false'],
                                                 [I18n.t('for_select.sick.plus'), 'true']]}
    config.columns[:ill_tb].required = true

    config.columns[:ill_syphilis].label = I18n.t('activerecord.attributes.visit.ill_syphilis')
    config.columns[:ill_syphilis].form_ui = :select
    config.columns[:ill_syphilis].options = {options: [['', ''],
                                                       [I18n.t('for_select.sick.minus'), 'false'],
                                                       [I18n.t('for_select.sick.plus'), 'true']]}
    config.columns[:ill_syphilis].required = true

    config.columns[:ill_mal].label = I18n.t('activerecord.attributes.visit.ill_mal')
    config.columns[:ill_mal].form_ui = :select
    config.columns[:ill_mal].options = {options: [['', ''],
                                                  [I18n.t('for_select.sick.minus'), 'false'],
                                                  [I18n.t('for_select.sick.plus'), 'true']]}
    config.columns[:ill_mal].required = true

    config.columns[:operation].label = I18n.t('activerecord.attributes.visit.operation')
    config.columns[:operation].form_ui = :select
    config.columns[:operation].options = {options: [['', ''],
                                                    [I18n.t('for_select.having.minus'), 'false'],
                                                    [I18n.t('for_select.having.plus'), 'true']]}
    config.columns[:operation].required = true

    config.columns[:transfusion].label = I18n.t('activerecord.attributes.visit.transfusion')
    config.columns[:transfusion].form_ui = :select
    config.columns[:transfusion].options = {options: [['', ''],
                                                      [I18n.t('for_select.having.minus'), 'false'],
                                                      [I18n.t('for_select.having.plus'), 'true']]}
    config.columns[:transfusion].required = true

    config.columns[:infection].label = I18n.t('activerecord.attributes.visit.infection')
    config.columns[:infection].form_ui = :select
    config.columns[:infection].options = {options: [['', ''],
                                                    [I18n.t('for_select.had.minus'), 'false'],
                                                    [I18n.t('for_select.had.plus'), 'true']]}
    config.columns[:infection].required = true

    config.columns[:dermis].label = I18n.t('activerecord.attributes.visit.dermis')
    config.columns[:dermis].form_ui = :select
    config.columns[:dermis].options = {options: [['', ''],
                                                 [I18n.t('for_select.was.minus'), 'false'],
                                                 [I18n.t('for_select.was.plus'), 'true']]}
    config.columns[:dermis].required = true

    config.columns[:dermis_doctor].label = I18n.t('activerecord.attributes.visit.dermis_doctor')
    config.columns[:dermis_doctor].form_ui = :select
    config.columns[:dermis_doctor].options = {options: [['', ''],
                                                        [I18n.t('for_select.allowed.plus'), 'true'],
                                                        [I18n.t('for_select.allowed.minus'), 'false']]}
    config.columns[:dermis_doctor].required = true

    config.columns[:doctor_skin].label = I18n.t('activerecord.attributes.visit.doctor_skin_id')
    config.columns[:doctor_skin].form_ui = :record_select
    config.columns[:doctor_skin].required = true

    config.columns[:pulse].label = I18n.t('activerecord.attributes.visit.pulse')
    config.columns[:pulse].options = {size: 3, maxlength: 3}

    config.columns[:sys_pressure].label = I18n.t('activerecord.attributes.visit.sys_pressure')
    config.columns[:sys_pressure].options = {size: 3, maxlength: 3}

    config.columns[:dias_pressure].label = I18n.t('activerecord.attributes.visit.dias_pressure')
    config.columns[:dias_pressure].options = {size: 3, maxlength: 3}

    config.columns[:allow_amount].label = I18n.t('activerecord.attributes.visit.allow_amount')
    config.columns[:allow_amount].required = true
    config.columns[:allow_amount].options = {size: 3, maxlength: 3}

    config.columns[:therapist_doctor].label = I18n.t('activerecord.attributes.visit.therapist_doctor')
    config.columns[:therapist_doctor].form_ui = :select
    config.columns[:therapist_doctor].options = {options: [['', ''],
                                                           [I18n.t('for_select.healthy.plus'), 'true'],
                                                           [I18n.t('for_select.healthy.minus'), 'false']]}
    config.columns[:therapist_doctor].required = true

    config.columns[:doctor_therapist].label = I18n.t('activerecord.attributes.visit.doctor_therapist_id')
    config.columns[:doctor_therapist].form_ui = :record_select
    config.columns[:doctor_therapist].required = true

    config.columns[:defect_cause].label = I18n.t('activerecord.attributes.visit.defect_cause_id')
    config.columns[:defect_cause].clear_link
    config.columns[:defect_cause].form_ui = :record_select

    config.columns[:date_donation].label = I18n.t('activerecord.attributes.visit.date_donation')
    config.columns[:date_donation].options = {size: 10, maxlength: 10}
    config.columns[:date_donation].required = true

    config.columns[:doctor_donation].label = I18n.t('activerecord.attributes.visit.doctor_donation_id')
    config.columns[:doctor_donation].form_ui = :record_select
    config.columns[:doctor_donation].required = true

    config.columns[:donation_mode].label = I18n.t('activerecord.attributes.visit.donation_mode_id')
    config.columns[:donation_mode].form_ui = :record_select
    config.columns[:donation_mode].required = true

    config.columns[:donation_type].label = I18n.t('activerecord.attributes.visit.donation_type_id')
    config.columns[:donation_type].form_ui = :record_select
    config.columns[:donation_type].required = true

    config.columns[:amount_probe].label = I18n.t('activerecord.attributes.visit.amount_probe')
    config.columns[:amount_probe].required = true
    config.columns[:amount_probe].options = {size: 3, maxlength: 3}

    config.columns[:amount_dose].label = I18n.t('activerecord.attributes.visit.amount_dose')
    config.columns[:amount_dose].required = true
    config.columns[:amount_dose].options = {size: 3, maxlength: 3}

    config.columns[:type_packing].label = I18n.t('activerecord.attributes.visit.type_packing_id')
    config.columns[:type_packing].form_ui = :record_select
    config.columns[:type_packing].required = true

    config.columns[:bottle_number].label = I18n.t('activerecord.attributes.visit.bootle_number')
    config.columns[:bottle_number].required = true
    config.columns[:bottle_number].options = {maxlength: 30}

    config.columns[:inspect_bilirubin].label = I18n.t('activerecord.attributes.visit.inspect_bilirubin')
    config.columns[:inspect_bilirubin].required = true
    config.columns[:inspect_bilirubin].options = {maxlength: 10}

    config.columns[:inspect_alt].label = I18n.t('activerecord.attributes.visit.inspect_alt')
    config.columns[:inspect_alt].required = true
    config.columns[:inspect_alt].options = {maxlength: 10}

    config.columns[:inspect_syphilis].label = I18n.t('activerecord.attributes.visit.inspect_syphilis')
    config.columns[:inspect_syphilis].form_ui = :select
    config.columns[:inspect_syphilis].options = {options: [[I18n.t('for_select.inspect.minus'), 0],
                                                           [I18n.t('for_select.inspect.logic_plus'), 2],
                                                           [I18n.t('for_select.inspect.plus'), 1]]}
    config.columns[:inspect_syphilis].required = true

    config.columns[:date_syphilis].label = I18n.t('activerecord.attributes.visit.date_syphilis')
    config.columns[:date_syphilis].options = {size: 10, maxlength: 10}
    config.columns[:date_syphilis].required = true

    config.columns[:inspect_hep_c].label = I18n.t('activerecord.attributes.visit.inspect_hep_c')
    config.columns[:inspect_hep_c].form_ui = :select
    config.columns[:inspect_hep_c].options = {options: [[I18n.t('for_select.inspect.minus'), 0],
                                                        [I18n.t('for_select.inspect.logic_plus'), 2],
                                                        [I18n.t('for_select.inspect.plus'), 1]]}
    config.columns[:inspect_hep_c].required = true

    config.columns[:date_hep_c].label = I18n.t('activerecord.attributes.visit.date_hep_c')
    config.columns[:date_hep_c].options = {size: 10, maxlength: 10}
    config.columns[:date_hep_c].required = true

    config.columns[:inspect_hep_b].label = I18n.t('activerecord.attributes.visit.inspect_hep_b')
    config.columns[:inspect_hep_b].form_ui = :select
    config.columns[:inspect_hep_b].options = {options: [[I18n.t('for_select.inspect.minus'), 0],
                                                        [I18n.t('for_select.inspect.logic_plus'), 2],
                                                        [I18n.t('for_select.inspect.plus'), 1]]}
    config.columns[:inspect_hep_b].required = true

    config.columns[:date_hep_b].label = I18n.t('activerecord.attributes.visit.date_hep_b')
    config.columns[:date_hep_b].options = {size: 10, maxlength: 10}
    config.columns[:date_hep_b].required = true

    config.columns[:inspect_aids].label = I18n.t('activerecord.attributes.visit.inspect_aids')
    config.columns[:inspect_aids].form_ui = :select
    config.columns[:inspect_aids].options = {options: [[I18n.t('for_select.inspect.minus'), 0],
                                                       [I18n.t('for_select.inspect.logic_plus'), 2],
                                                       [I18n.t('for_select.inspect.plus'), 1]]}
    config.columns[:inspect_aids].required = true

    config.columns[:date_aids].label = I18n.t('activerecord.attributes.visit.date_aids')
    config.columns[:date_aids].options = {size: 10, maxlength: 10}
    config.columns[:date_aids].required = true

    config.columns[:post_inspect_syphilis].label = I18n.t('activerecord.attributes.visit.post_inspect_syphilis')
    config.columns[:post_inspect_syphilis].form_ui = :select
    config.columns[:post_inspect_syphilis].options = {options: [['', ''],
                                                                [I18n.t('for_select.inspect.minus'), 'true'],
                                                                [I18n.t('for_select.inspect.plus'), 'false']]}
    config.columns[:post_inspect_syphilis].required = false

    config.columns[:post_date_syphilis].label = I18n.t('activerecord.attributes.visit.post_date_syphilis')
    config.columns[:post_date_syphilis].options = {size: 10, maxlength: 10}

    config.columns[:org_syphilis].label = I18n.t('activerecord.attributes.visit.org_syphilis_id')
    config.columns[:org_syphilis].form_ui = :record_select

    config.columns[:post_inspect_hep_c].label = I18n.t('activerecord.attributes.visit.post_inspect_hep_c')
    config.columns[:post_inspect_hep_c].form_ui = :select
    config.columns[:post_inspect_hep_c].options = {options: [['', ''],
                                                             [I18n.t('for_select.inspect.minus'), 'true'],
                                                             [I18n.t('for_select.inspect.plus'), 'false']]}
    config.columns[:post_inspect_hep_c].required = false

    config.columns[:post_date_hep_c].label = I18n.t('activerecord.attributes.visit.date_hep_c')
    config.columns[:post_date_hep_c].options = {size: 10, maxlength: 10}

    config.columns[:org_hep_c].label = I18n.t('activerecord.attributes.visit.org_hep_c_id')
    config.columns[:org_hep_c].form_ui = :record_select

    config.columns[:post_inspect_hep_b].label = I18n.t('activerecord.attributes.visit.post_inspect_hep_b')
    config.columns[:post_inspect_hep_b].form_ui = :select
    config.columns[:post_inspect_hep_b].options = {options: [['', ''],
                                                             [I18n.t('for_select.inspect.minus'), 'true'],
                                                             [I18n.t('for_select.inspect.plus'), 'false']]}
    config.columns[:post_inspect_hep_b].required = false

    config.columns[:post_date_hep_b].label = I18n.t('activerecord.attributes.visit.date_hep_b')
    config.columns[:post_date_hep_b].options = {size: 10, maxlength: 10}

    config.columns[:org_hep_b].label = I18n.t('activerecord.attributes.visit.org_hep_b_id')
    config.columns[:org_hep_b].form_ui = :record_select

    config.columns[:post_inspect_aids].label = I18n.t('activerecord.attributes.visit.post_inspect_aids')
    config.columns[:post_inspect_aids].form_ui = :select
    config.columns[:post_inspect_aids].options = {options: [['', ''],
                                                            [I18n.t('for_select.inspect.minus'), 'true'],
                                                            [I18n.t('for_select.inspect.plus'), 'false']]}
    config.columns[:post_inspect_aids].required = false

    config.columns[:post_date_aids].label = I18n.t('activerecord.attributes.visit.post_date_aids')
    config.columns[:post_date_aids].options = {size: 10, maxlength: 10}

    config.columns[:org_aids].label = I18n.t('activerecord.attributes.visit.org_aids_id')
    config.columns[:org_aids].form_ui = :record_select

    config.show.columns.add_subgroup I18n.t('visit.group_card') do |card|
      card.add :card_number, :reg_date, :code_org, :org_reception, :org_address
    end
    config.show.columns.add_subgroup I18n.t('visit.group_way') do |way|
      way.add :send_village, :send_org, :send_dep, :target, :type_payment, :previous_date, :previous_place,
              :target_someone, :type_donation, :reception
    end
    config.show.columns.add_subgroup I18n.t('visit.group_person') do |person|
      person.add :donor_name, :gender, :birth_date, :age, :visit_date
    end
    config.show.columns.add_subgroup I18n.t('visit.group_live') do |live|
      live.add :country, :post_code, :region, :district, :type_village, :village, :address
    end
    config.show.columns.add_subgroup I18n.t('visit.group_work') do |work|
      work.add :work, :job
    end
    config.show.columns.add_subgroup I18n.t("visit.group_registry") do |registry|
      registry.add :reg_name
    end
    config.show.columns.add_subgroup I18n.t('visit.group_labor') do |laboratory|
      laboratory.add :amount_probe, :blood_group, :control_blood, :rh_factor, :rh_control, :hbs
    end
    config.show.columns.add_subgroup I18n.t('visit.group_inspect_syphilis') do |syphilis|
      syphilis.add :inspect_syphilis, :date_syphilis, :post_inspect_syphilis, :post_date_syphilis, :org_syphilis
    end
    config.show.columns.add_subgroup I18n.t('visit.group_inspect_hep_c') do |hep_c|
      hep_c.add :inspect_hep_c, :date_hep_c, :post_inspect_hep_c, :post_date_hep_c, :org_hep_c
    end
    config.show.columns.add_subgroup I18n.t('visit.group_inspect_hep_b') do |hep_b|
      hep_b.add :inspect_hep_b, :date_hep_b, :post_inspect_hep_b, :post_date_hep_b, :org_hep_b
    end
    config.show.columns.add_subgroup I18n.t('visit.group_inspect_aids') do |aids|
      aids.add :inspect_aids, :date_aids, :post_inspect_aids, :post_date_aids, :org_aids
    end
    config.show.columns.add_subgroup I18n.t('visit.group_inspect') do |inspect|
      inspect.add :inspect_bilirubin, :inspect_alt, :analysis_date, :doctor_test, :doctor_aid
    end
    config.show.columns.add_subgroup I18n.t('visit.group_skin') do |skin|
      skin.add :ill_hepatitis, :ill_tb, :ill_syphilis, :ill_mal, :operation, :transfusion, :infection, :dermis,
               :dermis_doctor, :doctor_skin
    end
    config.show.columns.add_subgroup I18n.t('visit.group_therapist') do |therapist|
      therapist.add :pulse, :sys_pressure, :dias_pressure, :allow_amount, :blood_for, :therapist_doctor, :defect_cause,
                    :doctor_therapist
    end
    config.show.columns.add_subgroup I18n.t('visit.group_visit') do |donation|
      donation.add :date_donation, :donation_mode, :donation_type, :amount_dose, :type_packing, :bottle_number,
                   :doctor_donation
    end

    config.create.columns.add_subgroup I18n.t('visit.group_card') do |card|
      card.add :reg_date, :org_reception, :org_address
    end
    config.create.columns.add_subgroup I18n.t('visit.group_way') do |way|
      way.add :send_village, :send_org, :send_dep, :target, :type_payment, :previous_date, :previous_place,
              :target_someone, :type_donation, :reception
    end
    config.create.columns.add_subgroup I18n.t('visit.group_person') do |person|
      person.add :donor_name, :gender, :birth_date, :age, :visit_date
    end
    config.create.columns.add_subgroup I18n.t('visit.group_live') do |live|
      live.add :country, :post_code, :region, :district, :type_village, :village, :address
    end
    config.create.columns.add_subgroup I18n.t('visit.group_work') do |work|
      work.add :work, :job
    end
    config.create.columns.add_subgroup I18n.t('visit.group_registry') do |registry|
      registry.add :reg_name
    end
    config.create.columns.add_subgroup I18n.t('visit.group_labor') do |laboratory|
      laboratory.add :amount_probe, :blood_group, :control_blood, :rh_factor, :rh_control, :hbs
    end
    config.create.columns.add_subgroup I18n.t('visit.group_inspect') do |inspect|
      inspect.add :inspect_syphilis, :date_syphilis, :inspect_hep_c, :date_hep_c, :inspect_hep_b, :date_hep_b,
                  :inspect_bilirubin, :inspect_alt, :inspect_aids, :date_aids, :analysis_date, :doctor_test,
                  :doctor_aid
    end
    config.create.columns.add_subgroup I18n.t('visit.group_skin') do |skin|
      skin.add :ill_hepatitis, :ill_tb, :ill_syphilis, :ill_mal, :operation, :transfusion, :infection, :dermis,
               :dermis_doctor, :doctor_skin
    end
    config.create.columns.add_subgroup I18n.t('visit.group_therapist') do |therapist|
      therapist.add :pulse, :sys_pressure, :dias_pressure, :allow_amount, :blood_for, :therapist_doctor, :defect_cause,
                    :doctor_therapist
    end
    config.create.columns.add_subgroup I18n.t('visit.group_visit') do |donation|
      donation.add :date_donation, :donation_mode, :donation_type, :amount_dose, :type_packing, :bottle_number,
                   :doctor_donation
    end

    config.update.columns.add_subgroup I18n.t('visit.group_card') do |card|
      card.add :reg_date, :org_reception, :org_address
    end
    config.update.columns.add_subgroup I18n.t('visit.group_way') do |way|
      way.add :send_village, :send_org, :send_dep, :target, :type_payment, :previous_date, :previous_place,
              :target_someone, :type_donation, :reception
    end
    config.update.columns.add_subgroup I18n.t('visit.group_person') do |person|
      person.add :donor_name, :gender, :birth_date, :age, :visit_date
    end
    config.update.columns.add_subgroup I18n.t('visit.group_live') do |live|
      live.add :country, :post_code, :region, :district, :type_village, :village, :address
    end
    config.update.columns.add_subgroup I18n.t('visit.group_work') do |work|
      work.add :work, :job
    end
    config.update.columns.add_subgroup I18n.t('visit.group_registry') do |registry|
      registry.add :reg_name
    end
    config.update.columns.add_subgroup I18n.t('visit.group_labor') do |laboratory|
      laboratory.add :amount_probe, :blood_group, :control_blood, :rh_factor, :rh_control, :hbs
    end
    config.update.columns.add_subgroup I18n.t('visit.group_inspect_syphilis') do |syphilis|
      syphilis.add :inspect_syphilis, :date_syphilis, :post_inspect_syphilis, :post_date_syphilis, :org_syphilis
    end
    config.update.columns.add_subgroup I18n.t('visit.group_inspect_hep_c') do |hep_c|
      hep_c.add :inspect_hep_c, :date_hep_c, :post_inspect_hep_c, :post_date_hep_c, :org_hep_c
    end
    config.update.columns.add_subgroup I18n.t('visit.group_inspect_hep_b') do |hep_b|
      hep_b.add :inspect_hep_b, :date_hep_b, :post_inspect_hep_b, :post_date_hep_b, :org_hep_b
    end
    config.update.columns.add_subgroup I18n.t('visit.group_inspect_aids') do |aids|
      aids.add :inspect_aids, :date_aids, :post_inspect_aids, :post_date_aids, :org_aids
    end
    config.update.columns.add_subgroup I18n.t('visit.group_inspect') do |inspect|
      inspect.add :inspect_bilirubin, :inspect_alt, :analysis_date, :doctor_test, :doctor_aid
    end
    config.update.columns.add_subgroup I18n.t('visit.group_skin') do |skin|
      skin.add :ill_hepatitis, :ill_tb, :ill_syphilis, :ill_mal, :operation, :transfusion, :infection, :dermis,
               :dermis_doctor, :doctor_skin
    end
    config.update.columns.add_subgroup I18n.t('visit.group_therapist') do |therapist|
      therapist.add :pulse, :sys_pressure, :dias_pressure, :allow_amount, :blood_for, :therapist_doctor, :defect_cause,
                    :doctor_therapist
    end
    config.update.columns.add_subgroup I18n.t('visit.group_visit') do |donation|
      donation.add :date_donation, :donation_mode, :donation_type, :amount_dose, :type_packing, :bottle_number,
                   :doctor_donation
    end
  end

  def show
    super
  rescue ActiveRecord::RecordNotFound
    render nothing: true
  end

  def edit
    super
  rescue ActiveRecord::RecordNotFound
    render nothing: true
  end

  def update
    super
  rescue
    render nothing: true
  end

  def new
    super
  rescue ActiveRecord::RecordNotFound
    render nothing: true
  end

  protected

  def do_new
    super

    donor = Donor.find(params[:donor_id])
    visit = Visit.where(donor_id: params[:donor_id]).order(:date_donation).last
    date_now = Time.now

    @record.attributes = {reg_date: date_now, visit_date: date_now, date_donation: date_now,
                          blood_group_id: donor.blood_group_id, rh_factor_id: donor.rh_factor_id,
                          donor_name: donor.name, gender: donor.gender, birth_date: donor.birth_date,
                          post_code: donor.post_code, country_id: donor.country_id, region_id: donor.region_id,
                          district_id: donor.district_id, type_village: donor.type_village,
                          village_id: donor.village_id, address: donor.address, work: donor.work, job: donor.job,
                          inspect_syphilis: 0, inspect_hep_c: 0, inspect_hep_b: 0, inspect_aids: 0,
                          ill_hepatitis: false, ill_tb: false, ill_syphilis: false, ill_mal: false, operation: false,
                          transfusion: false, infection: false, dermis: false, dermis_doctor: true,
                          therapist_doctor: true}
    unless donor.birth_date.blank?
      between_day = date_now.to_date - donor.birth_date.to_date
      @record.age = ((between_day.ceil + (between_day/1460).ceil)/365).ceil
    end
    @record.type_donation = case
                              when visit.blank? then VISIT[0]
                              when visit.date_donation.blank? then VISIT[2]
                              when visit.date_donation.year < date_now.year then VISIT[1]
                              when visit.date_donation.year == date_now.year then VISIT[2]
                            end
    @record.previous_date = visit[:date_donation] unless visit.blank?
  end

  def do_edit
    super

    donor = Donor.find(params[:donor_id])

    @record.blood_group_id = donor.blood_group_id if @record.blood_group_id.blank?
    @record.rh_factor_id = donor.rh_factor_id if @record.rh_factor_id.blank?
    @record.donor_name = donor.name if @record.donor_name.blank?
    @record.gender = donor.gender if @record.gender.blank?
    @record.birth_date = donor.birth_date if @record.birth_date.blank?
    if @record.age.blank? and !donor.birth_date.blank? and !@record.visit_date.blank?
      between_day = @record.visit_date.to_date - donor.birth_date.to_date
      @record.age = ((between_day.ceil + (between_day/1460).ceil)/365).ceil
    end
    @record.post_code = donor.post_code if @record.post_code.blank?
    @record.country_id = donor.country_id if @record.country_id.blank?
    @record.region_id = donor.region_id if @record.region_id.blank?
    @record.district_id = donor.district_id if @record.district_id.blank?
    @record.type_village = donor.type_village if @record.type_village.blank?
    @record.village_id = donor.village_id if @record.village_id.blank?
    @record.address = donor.address if @record.address.blank?
    @record.work = donor.work if @record.work.blank?
    @record.job = donor.job if @record.job.blank?
  end

  def before_create_save(record)
    donor = Donor.find(params[:donor_id])

    record.code_org = CODE_ORG
    record.donor_id = params[:donor_id]
    record.card_number = [donor.card_number.blank? ? Time.now.strftime('%H%M%S') : donor.card_number,
                          record.date_donation.blank? ? Time.now.strftime('%d%m%Y') : record.date_donation.to_date.strftime('%d%m%Y')].join('/')
  end

  def before_update_save(record)
    donor = Donor.find(params[:donor_id])

    record.code_org = CODE_ORG
    record.card_number = [donor.card_number.blank? ? Time.now.strftime('%H%M%S') : donor.card_number,
                          record.date_donation.blank? ? Time.now.strftime('%d%m%Y') : record.date_donation.to_date.strftime('%d%m%Y')].join('/') if record.card_number.blank?
  end

end