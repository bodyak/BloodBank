# -*- encoding : utf-8 -*-

class DonorDefectsController < ApplicationController

  active_scaffold :donor_defect do |config|
    config.columns = [:defect_org, :defect_cause, :defect_date, :defect_end]

    config.list.columns = [:defect_org, :defect_cause, :defect_date, :defect_end]
    config.list.per_page = 20
    config.list.empty_field_text = ""

    config.create.refresh_list = true

    config.columns[:defect_org].label = I18n.t("activerecord.attributes.donor_defect.defect_org_id")
    config.columns[:defect_org].form_ui = :record_select
    config.columns[:defect_org].required = true

    config.columns[:defect_cause].label = I18n.t("activerecord.attributes.donor_defect.defect_cause_id")
    config.columns[:defect_cause].form_ui = :record_select
    config.columns[:defect_cause].required = true

    config.columns[:defect_date].label = I18n.t("activerecord.attributes.donor_defect.defect_date")
    config.columns[:defect_date].options = {size: 10, maxlength: 10}

    config.columns[:defect_end].label = I18n.t("activerecord.attributes.donor_defect.defect_end")
    config.columns[:defect_end].options = {size: 10, maxlength: 10}
  end

end