# -*- encoding : utf-8 -*-

class DonorDocumentsController < ApplicationController

  active_scaffold :donor_document do |config|
    config.columns = [:doc, :serial_doc, :number_doc, :date_doc, :org_doc]

    config.list.columns = [:doc, :serial_doc, :number_doc, :date_doc, :org_doc]
    config.list.per_page = 20
    config.list.empty_field_text = ""

    config.create.refresh_list = true

    config.columns[:doc].label = I18n.t("activerecord.attributes.donor_document.doc_id")
    config.columns[:doc].form_ui = :record_select
    config.columns[:doc].required = true

    config.columns[:serial_doc].label = I18n.t("activerecord.attributes.donor_document.serial_doc")
    config.columns[:serial_doc].required = true
    config.columns[:serial_doc].options = {maxlength: 30}

    config.columns[:number_doc].label = I18n.t("activerecord.attributes.donor_document.number_doc")
    config.columns[:number_doc].required = true
    config.columns[:number_doc].options = {maxlength: 30}

    config.columns[:date_doc].label = I18n.t("activerecord.attributes.donor_document.date_doc")
    config.columns[:date_doc].options = {size: 10, maxlength: 10}

    config.columns[:org_doc].label = I18n.t("activerecord.attributes.donor_document.org_doc")
    config.columns[:org_doc].options = {maxlength: 100}
  end

end