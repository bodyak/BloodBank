# -*- encoding : utf-8 -*-

class DonorsController < ApplicationController

  active_scaffold :donor do |config|
    config.actions = [:create, :list, :show, :update, :delete, :nested, :field_search, :subform]

    config.columns = [:card_number, :code_org, :cat_donor, :org_donate, :visit_date, :reg_date, :blood_group,
                      :rh_factor, :hla_factor, :last_name, :first_name, :middle_name, :gender, :birth_date, :post_code,
                      :country, :region, :district, :type_village, :village, :address, :tel_home, :work, :job,
                      :tel_work, :reg_name, :doctor_chief, :visits, :visitations, :donor_documents, :donor_defects,
                      :last_visit_day, :villages_send, :deps_send, :orgs_send, :someones_target, :ones_target,
                      :causes_defect]

    # config.list.label = I18n.t('activerecord.models.donor')
    config.list.columns = [:last_name, :first_name, :middle_name, :cat_donor, :blood_group, :rh_factor, :last_visit_day,
                           :org_donate, :hla_factor, :country, :region, :district, :village, :reg_name, :villages_send,
                           :deps_send, :orgs_send, :someones_target, :ones_target, :causes_defect]
    config.list.per_page = 20
    config.list.sorting = [{last_name: :asc}, {first_name: :asc}, {middle_name: :asc}]
    config.list.empty_field_text = ''

    config.create.link.label = I18n.t('donor.create_link')
    config.create.label = I18n.t('donor.create')
    config.create.columns.exclude :card_number, :code_org, :visits, :visitations, :donor_defects, :last_visit_day,
                                  :villages_send, :deps_send, :orgs_send, :someones_target, :ones_target, :causes_defect
    config.create.refresh_list = true

    config.nested.add_link(:visits)
    config.nested.add_link(:visitations)
    # config.nested.add_link(:visits, label: I18n.t('activerecord.models.visit'))
    # config.nested.add_link(:visitations, label: I18n.t('activerecord.models.visitation'))

    config.show.columns.exclude :last_visit_day, :villages_send, :deps_send, :orgs_send, :someones_target, :ones_target,
                                :causes_defect

    config.update.columns.exclude :card_number, :code_org, :visits, :visitations, :last_visit_day, :villages_send,
                                  :deps_send, :orgs_send, :someones_target, :ones_target, :causes_defect
    config.update.refresh_list = true

    config.field_search.columns = [:last_name, :first_name, :middle_name, :cat_donor, :org_donate, :visit_date,
                                   :reg_date, :blood_group, :rh_factor, :hla_factor, :gender, :birth_date, :country,
                                   :region, :district, :village, :address, :work, :reg_name, :villages_send, :deps_send,
                                   :orgs_send, :someones_target, :ones_target, :causes_defect]
    config.field_search.human_conditions = true

    # config.columns[:visits].label = I18n.t('activerecord.models.visit')

    # config.columns[:visitations].label = I18n.t('activerecord.models.visitation')

    # config.columns[:donor_documents].label = I18n.t('activerecord.models.donor_document')

    # config.columns[:donor_defects].label = I18n.t('activerecord.models.donor_defect')

    # config.columns[:card_number].label = I18n.t('activerecord.attributes.donor.card_number')
    config.columns[:card_number].options[:format] = nil

    # config.columns[:code_org].label = I18n.t('activerecord.attributes.donor.code_org')

    # config.columns[:visit_date].label = I18n.t('activerecord.attributes.donor.visit_date')
    config.columns[:visit_date].options = {size: 10, maxlength: 10}
    config.columns[:visit_date].required = true

    # config.columns[:reg_date].label = I18n.t('activerecord.attributes.donor.reg_date')
    config.columns[:reg_date].options = {size: 10, maxlength: 10}
    config.columns[:reg_date].required = true

    # config.columns[:reg_name].label = I18n.t('activerecord.attributes.donor.reg_name_id')
    config.columns[:reg_name].clear_link
    config.columns[:reg_name].form_ui = :record_select
    config.columns[:reg_name].required = true
    config.columns[:reg_name].search_sql = 'donors.reg_name_id'
    config.columns[:reg_name].options = {multiple: true}

    # config.columns[:doctor_chief].label = I18n.t('activerecord.attributes.donor.doctor_chief_id')
    config.columns[:doctor_chief].form_ui = :record_select
    config.columns[:doctor_chief].required = true

    # config.columns[:gender].label = I18n.t('activerecord.attributes.donor.gender')
    config.columns[:gender].form_ui = :select
    config.columns[:gender].options = {options: [['', ''],
                                                 [I18n.t('for_select.gender.man'), 'true'],
                                                 [I18n.t('for_select.gender.woman'), 'false']]}
    config.columns[:gender].required = true

    # config.columns[:birth_date].label = I18n.t('activerecord.attributes.donor.birth_date')
    config.columns[:birth_date].options = {size: 10, maxlength: 10}

    # config.columns[:post_code].label = I18n.t('activerecord.attributes.donor.post_code')
    config.columns[:post_code].options = {maxlength: 20}

    # config.columns[:country].label = I18n.t('activerecord.attributes.donor.country_id')
    config.columns[:country].clear_link
    config.columns[:country].form_ui = :record_select
    config.columns[:country].search_sql = 'donors.country_id'
    config.columns[:country].options = {multiple: true}

    # config.columns[:region].label = I18n.t('activerecord.attributes.donor.region_id')
    config.columns[:region].clear_link
    config.columns[:region].form_ui = :record_select
    config.columns[:region].search_sql = 'donors.region_id'
    config.columns[:region].options = {multiple: true}

    # config.columns[:district].label = I18n.t('activerecord.attributes.donor.district_id')
    config.columns[:district].clear_link
    config.columns[:district].form_ui = :record_select
    config.columns[:district].search_sql = 'donors.district_id'
    config.columns[:district].options = {multiple: true}

    # config.columns[:type_village].label = I18n.t('activerecord.attributes.donor.type_village')
    config.columns[:type_village].form_ui = :select
    config.columns[:type_village].options = {options: [['', ''],
                                                       [I18n.t('for_select.type_village.town'), 'true'],
                                                       [I18n.t('for_select.type_village.village'), 'false']]}

    # config.columns[:village].label = I18n.t('activerecord.attributes.donor.village_id')
    config.columns[:village].clear_link
    config.columns[:village].form_ui = :record_select
    config.columns[:village].search_sql = 'donors.village_id'
    config.columns[:village].options = {multiple: true}

    # config.columns[:address].label = I18n.t('activerecord.attributes.donor.address')
    config.columns[:address].options = {maxlength: 100}

    # config.columns[:tel_home].label = I18n.t('activerecord.attributes.donor.tel_home')
    config.columns[:tel_home].options = {maxlength: 50}

    # config.columns[:work].label = I18n.t('activerecord.attributes.donor.work')
    config.columns[:work].options = {maxlength: 100}

    # config.columns[:job].label = I18n.t('activerecord.attributes.donor.job')
    config.columns[:job].options = {maxlength: 100}

    # config.columns[:tel_work].label = I18n.t('activerecord.attributes.donor.tel_work')
    config.columns[:tel_work].options = {maxlength: 50}

    # config.columns[:last_name].label = I18n.t('activerecord.attributes.donor.last_name')
    config.columns[:last_name].inplace_edit = :ajax
    config.columns[:last_name].required = true
    config.columns[:last_name].options = {maxlength: 30}

    # config.columns[:first_name].label = I18n.t('activerecord.attributes.donor.first_name')
    config.columns[:first_name].inplace_edit = :ajax
    config.columns[:first_name].required = true
    config.columns[:first_name].options = {maxlength: 30}

    # config.columns[:middle_name].label = I18n.t('activerecord.attributes.donor.middle_name')
    config.columns[:middle_name].inplace_edit = :ajax
    config.columns[:middle_name].required = true
    config.columns[:middle_name].options = {maxlength: 30}

    # config.columns[:cat_donor].label = I18n.t('activerecord.attributes.donor.cat_donor_id')
    config.columns[:cat_donor].clear_link
    config.columns[:cat_donor].sort_by sql: 'cat_donors_donors.value_name'
    config.columns[:cat_donor].form_ui = :record_select
    config.columns[:cat_donor].required = true
    config.columns[:cat_donor].search_sql = 'donors.cat_donor_id'
    config.columns[:cat_donor].options = {multiple: true}

    # config.columns[:blood_group].label = I18n.t('activerecord.attributes.donor.blood_group_id')
    config.columns[:blood_group].clear_link
    config.columns[:blood_group].sort_by sql: 'blood_groups_donors.value_name'
    config.columns[:blood_group].form_ui = :record_select
    config.columns[:blood_group].required = true
    config.columns[:blood_group].search_sql = 'donors.blood_group_id'
    config.columns[:blood_group].options = {multiple: true}

    # config.columns[:rh_factor].label = I18n.t('activerecord.attributes.donor.rh_factor_id')
    config.columns[:rh_factor].clear_link
    config.columns[:rh_factor].sort_by sql: 'rh_factors_donors.value_name'
    config.columns[:rh_factor].form_ui = :record_select
    config.columns[:rh_factor].required = true
    config.columns[:rh_factor].search_sql = 'donors.rh_factor_id'
    config.columns[:rh_factor].options = {multiple: true}

    # config.columns[:org_donate].label = I18n.t('activerecord.attributes.donor.org_donate_id')
    config.columns[:org_donate].clear_link
    config.columns[:org_donate].form_ui = :record_select
    config.columns[:org_donate].required = true
    config.columns[:org_donate].search_sql = 'donors.org_donate_id'
    config.columns[:org_donate].options = {multiple: true}

    # config.columns[:hla_factor].label = I18n.t('activerecord.attributes.donor.hla_factor_id')
    config.columns[:hla_factor].clear_link
    config.columns[:hla_factor].form_ui = :record_select
    config.columns[:hla_factor].search_sql = 'donors.hla_factor_id'
    config.columns[:hla_factor].options = {multiple: true}

    config.columns[:villages_send].clear_link
    config.columns[:villages_send].form_ui = :record_select
    config.columns[:villages_send].search_sql = 'visits.send_village_id'
    config.columns[:villages_send].options = {multiple: true}

    config.columns[:deps_send].clear_link
    config.columns[:deps_send].form_ui = :record_select
    config.columns[:deps_send].search_sql = 'visits.send_dep_id'
    config.columns[:deps_send].options = {multiple: true}

    config.columns[:orgs_send].clear_link
    config.columns[:orgs_send].form_ui = :record_select
    config.columns[:orgs_send].search_sql = 'visits.send_org_id'
    config.columns[:orgs_send].options = {multiple: true}

    config.columns[:someones_target].clear_link
    config.columns[:someones_target].form_ui = :record_select
    config.columns[:someones_target].search_sql = 'visits.target_someone_id'
    config.columns[:someones_target].options = {multiple: true}

    config.columns[:ones_target].clear_link
    config.columns[:ones_target].form_ui = :record_select
    config.columns[:ones_target].search_sql = 'visits.target_id'
    config.columns[:ones_target].options = {multiple: true}

    config.columns[:causes_defect].clear_link
    config.columns[:causes_defect].form_ui = :record_select
    config.columns[:causes_defect].search_sql = 'visits.defect_cause_id'
    config.columns[:causes_defect].options = {multiple: true}
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

  def row
    super
  rescue ActiveRecord::RecordNotFound
    render nothing: true
  end

  def edit_associated
    super
  rescue ActiveRecord::RecordNotFound
    render nothing: true
  end

  protected

  def do_new
    super
    @record.visit_date = Time.now
  end

  def do_edit
    super
    @record.visit_date = Time.now if @record.visit_date.blank?
  end

  def before_create_save(record)
    record.code_org = CODE_ORG
    record.card_number = Donor.max_card_number + 1
  end

  def before_update_save(record)
    record.code_org = CODE_ORG
    record.card_number = Donor.max_card_number + 1 if record.card_number.blank?
  end

end