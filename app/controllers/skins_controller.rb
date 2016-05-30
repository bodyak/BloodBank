# -*- encoding : utf-8 -*-

class SkinsController < ApplicationController

  active_scaffold :skin do |config|
    config.actions = [:create, :list, :show, :update, :delete, :field_search]

    config.columns = [:last_name, :first_name, :middle_name, :birth_date, :post_code, :country, :region, :district,
                      :village, :address, :defect_skin, :defect_org, :date_dermis_begin, :date_dermis_end, :reg_name]

    config.list.label = I18n.t('activerecord.models.skin')
    config.list.columns = [:last_name, :first_name, :middle_name, :defect_skin, :defect_org, :date_dermis_begin,
                           :date_dermis_end]
    config.list.per_page = 20
    config.list.sorting = [{last_name: :asc}, {first_name: :asc}, {middle_name: :asc}]
    config.list.empty_field_text = ''

    config.create.link.label = I18n.t('skin.create_link')
    config.create.label = I18n.t('skin.create')
    config.create.columns.exclude :card_number
    config.create.refresh_list = true

    config.show.columns.exclude :card_number

    config.update.columns.exclude :card_number
    config.update.refresh_list = true

    config.field_search.columns = [:last_name, :first_name, :middle_name]
    config.field_search.human_conditions = true

    config.columns[:last_name].label = I18n.t('activerecord.attributes.skin.last_name')
    config.columns[:last_name].inplace_edit = :ajax
    config.columns[:last_name].required = true
    config.columns[:last_name].options = {maxlength: 30}

    config.columns[:first_name].label = I18n.t('activerecord.attributes.skin.first_name')
    config.columns[:first_name].inplace_edit = :ajax
    config.columns[:first_name].required = true
    config.columns[:first_name].options = {maxlength: 30}

    config.columns[:middle_name].label = I18n.t('activerecord.attributes.skin.middle_name')
    config.columns[:middle_name].inplace_edit = :ajax
    config.columns[:middle_name].required = true
    config.columns[:middle_name].options = {maxlength: 30}

    config.columns[:birth_date].label = I18n.t('activerecord.attributes.skin.birth_date')
    config.columns[:birth_date].options = {size: 10, maxlength: 10}

    config.columns[:post_code].label = I18n.t('activerecord.attributes.skin.post_code')
    config.columns[:post_code].options = {maxlength: 20}

    config.columns[:country].label = I18n.t('activerecord.attributes.skin.country_id')
    config.columns[:country].form_ui = :record_select

    config.columns[:region].label = I18n.t('activerecord.attributes.skin.region_id')
    config.columns[:region].form_ui = :record_select

    config.columns[:district].label = I18n.t('activerecord.attributes.skin.district_id')
    config.columns[:district].form_ui = :record_select

    config.columns[:village].label = I18n.t('activerecord.attributes.skin.village_id')
    config.columns[:village].form_ui = :record_select

    config.columns[:address].label = I18n.t('activerecord.attributes.skin.address')
    config.columns[:address].options = {maxlength: 100}

    config.columns[:defect_skin].label = I18n.t('activerecord.attributes.skin.defect_skin_id')
    config.columns[:defect_skin].clear_link
    config.columns[:defect_skin].form_ui = :record_select
    config.columns[:defect_skin].required = true

    config.columns[:defect_org].label = I18n.t('activerecord.attributes.skin.defect_org_id')
    config.columns[:defect_org].clear_link
    config.columns[:defect_org].form_ui = :record_select
    config.columns[:defect_org].required = true

    config.columns[:date_dermis_begin].label = I18n.t('activerecord.attributes.skin.date_dermis_begin')
    config.columns[:date_dermis_begin].options = {size: 10, maxlength: 10}
    config.columns[:date_dermis_begin].required = true

    config.columns[:date_dermis_end].label = I18n.t('activerecord.attributes.skin.date_dermis_end')
    config.columns[:date_dermis_end].options = {size: 10, maxlength: 10}

    config.columns[:reg_name].label = I18n.t('activerecord.attributes.skin.reg_name_id')
    config.columns[:reg_name].form_ui = :record_select
    config.columns[:reg_name].required = true
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

  protected

  def before_create_save(record)
    record.card_number = Skin.max_card_number + 1
  end

  def before_update_save(record)
    record.card_number = Skin.max_card_number + 1 if record.card_number.blank?
  end

end
