# -*- encoding : utf-8 -*-

class VisitationsController < ApplicationController

  active_scaffold :visitation do |config|
    config.actions = [:create, :list, :show, :update, :delete]

    config.columns = [:card_number, :reg_date, :code_org, :org_reception, :org_address, :reception, :send_village,
                      :send_org, :send_dep, :visit_date, :target, :type_payment, :blood_group, :rh_factor, :donor_name,
                      :gender, :birth_date, :age, :post_code, :country, :region, :district, :type_village, :village,
                      :address, :work, :job, :reg_name, :control_blood, :rh_control, :ill_hepatitis, :ill_tb,
                      :ill_syphilis, :ill_mal, :operation, :transfusion, :infection, :dermis, :dermis_doctor,
                      :doctor_skin, :pulse, :sys_pressure, :dias_pressure, :allow_amount, :therapist_doctor,
                      :doctor_therapist, :defect_cause]

    config.list.label = I18n.t("activerecord.models.visitation")
    config.list.columns = [:donor_name, :visit_date]
    config.list.per_page = 20
    config.list.empty_field_text = ""

    config.create.link.label = I18n.t("visitation.create_link")
    config.create.label = I18n.t("visitation.create")
    config.create.columns.exclude :card_number, :code_org

    config.update.columns.exclude :card_number, :code_org

    config.columns[:card_number].label = I18n.t("activerecord.attributes.visitation.card_number")

    config.columns[:reg_date].label = I18n.t("activerecord.attributes.visitation.reg_date")
    config.columns[:reg_date].options = {size: 10, maxlength: 10}
    config.columns[:reg_date].required = true

    config.columns[:code_org].label = I18n.t("activerecord.attributes.visitation.code_org")

    config.columns[:org_reception].label = I18n.t("activerecord.attributes.visitation.org_reception_id")
    config.columns[:org_reception].form_ui = :record_select

    config.columns[:org_address].label = I18n.t("activerecord.attributes.visitation.org_address_id")
    config.columns[:org_address].form_ui = :record_select

    config.columns[:reception].label = I18n.t("activerecord.attributes.visitation.reception_id")
    config.columns[:reception].form_ui = :record_select
    config.columns[:reception].required = true

    config.columns[:send_village].label = I18n.t("activerecord.attributes.visitation.send_village_id")
    config.columns[:send_village].form_ui = :record_select

    config.columns[:send_org].label = I18n.t("activerecord.attributes.visitation.send_org_id")
    config.columns[:send_org].form_ui = :record_select

    config.columns[:send_dep].label = I18n.t("activerecord.attributes.visitation.send_dep_id")
    config.columns[:send_dep].form_ui = :record_select

    config.columns[:visit_date].label = I18n.t("activerecord.attributes.visitation.visit_date")
    config.columns[:visit_date].options = {size: 10, maxlength: 10}
    config.columns[:visit_date].required = true

    config.columns[:target].label = I18n.t("activerecord.attributes.visitation.target_id")
    config.columns[:target].form_ui = :record_select

    config.columns[:type_payment].label = I18n.t("activerecord.attributes.visitation.type_payment")
    config.columns[:type_payment].form_ui = :select
    config.columns[:type_payment].options = {options: [["", ""],
                                                       [I18n.t("for_select.payment.plus"), "true"],
                                                       [I18n.t("for_select.payment.minus"), "false"]]}
    config.columns[:type_payment].required = true

    config.columns[:blood_group].label = I18n.t("activerecord.attributes.visitation.blood_group_id")
    config.columns[:blood_group].form_ui = :record_select
    config.columns[:blood_group].required = true

    config.columns[:rh_factor].label = I18n.t("activerecord.attributes.visitation.rh_factor_id")
    config.columns[:rh_factor].form_ui = :record_select
    config.columns[:rh_factor].required = true

    config.columns[:donor_name].label = I18n.t("activerecord.attributes.visitation.donor_name")
    config.columns[:donor_name].sort = false
    config.columns[:donor_name].required = true
    config.columns[:donor_name].options = {maxlength: 100}

    config.columns[:gender].label = I18n.t("activerecord.attributes.visitation.gender")
    config.columns[:gender].form_ui = :select
    config.columns[:gender].options = {options: [["", ""],
                                                 [I18n.t("for_select.gender.man"), "true"],
                                                 [I18n.t("for_select.gender.woman"), "false"]]}
    config.columns[:gender].required = true

    config.columns[:birth_date].label = I18n.t("activerecord.attributes.visitation.birth_date")
    config.columns[:birth_date].options = {size: 10, maxlength: 10}

    config.columns[:age].label = I18n.t("activerecord.attributes.visitation.age")
    config.columns[:age].options = {maxlength: 3, size: 3}

    config.columns[:post_code].label = I18n.t("activerecord.attributes.visitation.post_code")
    config.columns[:post_code].options = {maxlength: 20}

    config.columns[:country].label = I18n.t("activerecord.attributes.visitation.country_id")
    config.columns[:country].form_ui = :record_select

    config.columns[:region].label = I18n.t("activerecord.attributes.visitation.region_id")
    config.columns[:region].form_ui = :record_select

    config.columns[:district].label = I18n.t("activerecord.attributes.visitation.district_id")
    config.columns[:district].form_ui = :record_select

    config.columns[:type_village].label = I18n.t("activerecord.attributes.visitation.type_village")
    config.columns[:type_village].form_ui = :select
    config.columns[:type_village].options = {options: [["", ""],
                                                       [I18n.t("for_select.type_village.town"), "true"],
                                                       [I18n.t("for_select.type_village.village"), "false"]]}

    config.columns[:village].label = I18n.t("activerecord.attributes.visitation.village_id")
    config.columns[:village].form_ui = :record_select

    config.columns[:address].label = I18n.t("activerecord.attributes.visitation.address")
    config.columns[:address].options = {maxlength: 100}

    config.columns[:work].label = I18n.t("activerecord.attributes.visitation.work")
    config.columns[:work].options = {maxlength: 100}

    config.columns[:job].label = I18n.t("activerecord.attributes.visitation.job")
    config.columns[:job].options = {maxlength: 100}

    config.columns[:reg_name].label = I18n.t("activerecord.attributes.visitation.reg_name")
    config.columns[:reg_name].form_ui = :record_select
    config.columns[:reg_name].required = true

    config.columns[:control_blood].label = I18n.t("activerecord.attributes.visitation.control_blood_id")
    config.columns[:control_blood].form_ui = :record_select

    config.columns[:rh_control].label = I18n.t("activerecord.attributes.visitation.rh_control_id")
    config.columns[:rh_control].form_ui = :record_select

    config.columns[:ill_hepatitis].label = I18n.t("activerecord.attributes.visitation.ill_hepatitis")
    config.columns[:ill_hepatitis].form_ui = :select
    config.columns[:ill_hepatitis].options = {options: [["", ""],
                                                        [I18n.t("for_select.sick.minus"), "false"],
                                                        [I18n.t("for_select.sick.plus"), "true"]]}
    config.columns[:ill_hepatitis].required = true

    config.columns[:ill_tb].label = I18n.t("activerecord.attributes.visitation.ill_tb")
    config.columns[:ill_tb].form_ui = :select
    config.columns[:ill_tb].options = {options: [["", ""],
                                                 [I18n.t("for_select.sick.minus"), "false"],
                                                 [I18n.t("for_select.sick.plus"), "true"]]}
    config.columns[:ill_tb].required = true

    config.columns[:ill_syphilis].label = I18n.t("activerecord.attributes.visitation.ill_syphilis")
    config.columns[:ill_syphilis].form_ui = :select
    config.columns[:ill_syphilis].options = {options: [["", ""],
                                                       [I18n.t("for_select.sick.minus"), "false"],
                                                       [I18n.t("for_select.sick.plus"), "true"]]}
    config.columns[:ill_syphilis].required = true

    config.columns[:ill_mal].label = I18n.t("activerecord.attributes.visitation.ill_mal")
    config.columns[:ill_mal].form_ui = :select
    config.columns[:ill_mal].options = {options: [["", ""],
                                                  [I18n.t("for_select.sick.minus"), "false"],
                                                  [I18n.t("for_select.sick.plus"), "true"]]}
    config.columns[:ill_mal].required = true

    config.columns[:operation].label = I18n.t("activerecord.attributes.visitation.operation")
    config.columns[:operation].form_ui = :select
    config.columns[:operation].options = {options: [["", ""],
                                                    [I18n.t("for_select.having.minus"), "false"],
                                                    [I18n.t("for_select.having.plus"), "true"]]}
    config.columns[:operation].required = true

    config.columns[:transfusion].label = I18n.t("activerecord.attributes.visitation.transfusion")
    config.columns[:transfusion].form_ui = :select
    config.columns[:transfusion].options = {options: [["", ""],
                                                      [I18n.t("for_select.having.minus"), "false"],
                                                      [I18n.t("for_select.having.plus"), "true"]]}
    config.columns[:transfusion].required = true

    config.columns[:infection].label = I18n.t("activerecord.attributes.visitation.infection")
    config.columns[:infection].form_ui = :select
    config.columns[:infection].options = {options: [["", ""],
                                                    [I18n.t("for_select.had.minus"), "false"],
                                                    [I18n.t("for_select.had.plus"), "true"]]}
    config.columns[:infection].required = true

    config.columns[:dermis].label = I18n.t("activerecord.attributes.visitation.dermis")
    config.columns[:dermis].form_ui = :select
    config.columns[:dermis].options = {options: [["", ""],
                                                 [I18n.t("for_select.was.minus"), "false"],
                                                 [I18n.t("for_select.was.plus"), "true"]]}
    config.columns[:dermis].required = true

    config.columns[:dermis_doctor].label = I18n.t("activerecord.attributes.visitation.dermis_doctor")
    config.columns[:dermis_doctor].form_ui = :select
    config.columns[:dermis_doctor].options = {options: [["", ""],
                                                        [I18n.t("for_select.allowed.plus"), "true"],
                                                        [I18n.t("for_select.allowed.minus"), "false"]]}
    config.columns[:dermis_doctor].required = true

    config.columns[:doctor_skin].label = I18n.t("activerecord.attributes.visitation.doctor_skin_id")
    config.columns[:doctor_skin].form_ui = :record_select

    config.columns[:pulse].label = I18n.t("activerecord.attributes.visitation.pulse")
    config.columns[:pulse].options = {size: 3, maxlength: 3}

    config.columns[:sys_pressure].label = I18n.t("activerecord.attributes.visitation.sys_pressure")
    config.columns[:sys_pressure].options = {size: 3, maxlength: 3}

    config.columns[:dias_pressure].label = I18n.t("activerecord.attributes.visitation.dias_pressure")
    config.columns[:dias_pressure].options = {size: 3, maxlength: 3}

    config.columns[:allow_amount].label = I18n.t("activerecord.attributes.visitation.allow_amount")
    config.columns[:allow_amount].options = {size: 3, maxlength: 3}

    config.columns[:therapist_doctor].label = I18n.t("activerecord.attributes.visitation.therapist_doctor")
    config.columns[:therapist_doctor].form_ui = :select
    config.columns[:therapist_doctor].options = {options: [["", ""],
                                                           [I18n.t("for_select.healthy.plus"), "true"],
                                                           [I18n.t("for_select.healthy.minus"), "false"]]}
    config.columns[:therapist_doctor].required = true

    config.columns[:doctor_therapist].label = I18n.t("activerecord.attributes.visitation.doctor_therapist_id")
    config.columns[:doctor_therapist].form_ui = :record_select

    config.columns[:defect_cause].label = I18n.t("activerecord.attributes.visitation.defect_cause_id")
    config.columns[:defect_cause].clear_link
    config.columns[:defect_cause].form_ui = :record_select

    config.show.columns.add_subgroup I18n.t("visitation.group_card") do |card|
      card.add :card_number, :reg_date, :code_org, :org_reception, :org_address
    end
    config.show.columns.add_subgroup I18n.t("visitation.group_way") do |way|
      way.add :send_village, :send_org, :send_dep, :target, :type_payment, :reception
    end
    config.show.columns.add_subgroup I18n.t("visitation.group_person") do |person|
      person.add :donor_name, :gender, :birth_date, :age, :visit_date
    end
    config.show.columns.add_subgroup I18n.t("visitation.group_live") do |live|
      live.add :country, :post_code, :region, :district, :type_village, :village, :address
    end
    config.show.columns.add_subgroup I18n.t("visitation.group_work") do |work|
      work.add :work, :job
    end
    config.show.columns.add_subgroup I18n.t("visitation.group_registry") do |registry|
      registry.add :reg_name
    end
    config.show.columns.add_subgroup I18n.t("visitation.group_labor") do |laboratory|
      laboratory.add :blood_group, :control_blood, :rh_factor, :rh_control
    end
    config.show.columns.add_subgroup I18n.t("visitation.group_skin") do |skin|
      skin.add :ill_hepatitis, :ill_tb, :ill_syphilis, :ill_mal, :operation, :transfusion, :infection, :dermis,
               :dermis_doctor, :doctor_skin
    end
    config.show.columns.add_subgroup I18n.t("visitation.group_therapist") do |therapist|
      therapist.add :pulse, :sys_pressure, :dias_pressure, :allow_amount, :therapist_doctor, :defect_cause,
                    :doctor_therapist
    end

    config.create.columns.add_subgroup I18n.t("visitation.group_card") do |card|
      card.add :reg_date, :org_reception, :org_address
    end
    config.create.columns.add_subgroup I18n.t("visitation.group_way") do |way|
      way.add :send_village, :send_org, :send_dep, :target, :type_payment, :reception
    end
    config.create.columns.add_subgroup I18n.t("visitation.group_person") do |person|
      person.add :donor_name, :gender, :birth_date, :age, :visit_date
    end
    config.create.columns.add_subgroup I18n.t("visitation.group_live") do |live|
      live.add :country, :post_code, :region, :district, :type_village, :village, :address
    end
    config.create.columns.add_subgroup I18n.t("visitation.group_work") do |work|
      work.add :work, :job
    end
    config.create.columns.add_subgroup I18n.t("visitation.group_registry") do |registry|
      registry.add :reg_name
    end
    config.create.columns.add_subgroup I18n.t("visitation.group_labor") do |laboratory|
      laboratory.add :blood_group, :control_blood, :rh_factor, :rh_control
    end
    config.create.columns.add_subgroup I18n.t("visitation.group_skin") do |skin|
      skin.add :ill_hepatitis, :ill_tb, :ill_syphilis, :ill_mal, :operation, :transfusion, :infection, :dermis,
               :dermis_doctor, :doctor_skin
    end
    config.create.columns.add_subgroup I18n.t("visitation.group_therapist") do |therapist|
      therapist.add :pulse, :sys_pressure, :dias_pressure, :allow_amount, :therapist_doctor, :defect_cause,
                    :doctor_therapist
    end

    config.update.columns.add_subgroup I18n.t("visitation.group_card") do |card|
      card.add :reg_date, :org_reception, :org_address
    end
    config.update.columns.add_subgroup I18n.t("visitation.group_way") do |way|
      way.add :send_village, :send_org, :send_dep, :target, :type_payment, :reception
    end
    config.update.columns.add_subgroup I18n.t("visitation.group_person") do |person|
      person.add :donor_name, :gender, :birth_date, :age, :visit_date
    end
    config.update.columns.add_subgroup I18n.t("visitation.group_live") do |live|
      live.add :country, :post_code, :region, :district, :type_village, :village, :address
    end
    config.update.columns.add_subgroup I18n.t("visitation.group_work") do |work|
      work.add :work, :job
    end
    config.update.columns.add_subgroup I18n.t("visitation.group_registry") do |registry|
      registry.add :reg_name
    end
    config.update.columns.add_subgroup I18n.t("visitation.group_labor") do |laboratory|
      laboratory.add :blood_group, :control_blood, :rh_factor, :rh_control
    end
    config.update.columns.add_subgroup I18n.t("visitation.group_skin") do |skin|
      skin.add :ill_hepatitis, :ill_tb, :ill_syphilis, :ill_mal, :operation, :transfusion, :infection, :dermis,
               :dermis_doctor, :doctor_skin
    end
    config.update.columns.add_subgroup I18n.t("visitation.group_therapist") do |therapist|
      therapist.add :pulse, :sys_pressure, :dias_pressure, :allow_amount, :therapist_doctor, :defect_cause,
                    :doctor_therapist
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
    date_now = Time.now

    @record.attributes = {reg_date: date_now, visit_date: date_now, donor_name: donor.name,
                          blood_group_id: donor.blood_group_id, rh_factor_id: donor.rh_factor_id, gender: donor.gender,
                          birth_date: donor.birth_date, post_code: donor.post_code, country_id: donor.country_id,
                          region_id: donor.region_id, district_id: donor.district_id, type_village: donor.type_village,
                          village_id: donor.village_id, address: donor.address, work: donor.work, job: donor.job,
                          ill_hepatitis: false, ill_tb: false, ill_syphilis: false, ill_mal: false, operation: false,
                          transfusion: false, infection: false, dermis: false, dermis_doctor: true,
                          therapist_doctor: true}
    unless donor.birth_date.blank?
      between_day = date_now.to_date - donor.birth_date.to_date
      @record.age = ((between_day.ceil + (between_day/1460).ceil)/365).ceil
    end
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
    record.card_number = ["V", donor.card_number.blank? ? Time.now.strftime("%H%M%S") : donor.card_number,
                          record.visit_date.blank? ? Time.now.strftime("%d%m%Y") : record.visit_date.to_date.strftime("%d%m%Y")].join("/")
  end

  def before_update_save(record)
    donor = Donor.find(params[:donor_id])

    record.code_org = CODE_ORG
    record.card_number = ["V", donor.card_number.blank? ? Time.now.strftime("%H%M%S") : donor.card_number,
                          record.visit_date.blank? ? Time.now.strftime("%d%m%Y") : record.visit_date.to_date.strftime("%d%m%Y")].join("/") if record.card_number.blank?
  end

end