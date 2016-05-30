# -*- encoding : utf-8 -*-

class IsolationsController < ApplicationController

  active_scaffold :isolation do |config|
    config.actions = [:create, :list, :show, :update, :delete]

    config.columns = [:plasm_ag_amount, :plasm_ag_bootle, :plasm_ag_store, :plasm_krio_amount, :plasm_krio_bootle,
                      :plasm_krio_store, :plasm_proc_amount, :plasm_proc_bootle, :plasm_proc_store, :plasm_ac_amount,
                      :plasm_ac_bootle, :plasm_ac_store, :defect_aids, :defect_syph, :defect_hep_c, :defect_hep_b,
                      :wr_defect_date, :rep_exam_date, :end_quar_date, :give_dispatch, :give_fraction, :give_store]

    config.list.label = I18n.t("activerecord.models.isolation")
    config.list.columns = [:plasm_ag_amount, :plasm_krio_amount, :plasm_proc_amount, :plasm_ac_amount, :wr_defect_date,
                           :rep_exam_date, :end_quar_date, :give_dispatch, :give_fraction, :give_store]
    config.list.per_page = 20
    config.list.empty_field_text = ""

    config.create.link.label = I18n.t("isolation.create_link")
    config.create.label = I18n.t("isolation.create")

    config.columns[:plasm_ag_amount].label = I18n.t("activerecord.attributes.isolation.plasm_ag_amount")
    config.columns[:plasm_ag_amount].options = {size: 3, maxlength: 3}

    config.columns[:plasm_ag_bootle].label = I18n.t("activerecord.attributes.isolation.plasm_ag_bootle")
    config.columns[:plasm_ag_bootle].options = {maxlength: 30}

    config.columns[:plasm_ag_store].label = I18n.t("activerecord.attributes.isolation.plasm_ag_store")
    config.columns[:plasm_ag_store].options = {maxlength: 30}

    config.columns[:plasm_krio_amount].label = I18n.t("activerecord.attributes.isolation.plasm_krio_amount")
    config.columns[:plasm_krio_amount].options = {size: 3, maxlength: 3}

    config.columns[:plasm_krio_bootle].label = I18n.t("activerecord.attributes.isolation.plasm_krio_bootle")
    config.columns[:plasm_krio_bootle].options = {maxlength: 30}

    config.columns[:plasm_krio_store].label = I18n.t("activerecord.attributes.isolation.plasm_krio_store")
    config.columns[:plasm_krio_store].options = {maxlength: 30}

    config.columns[:plasm_proc_amount].label = I18n.t("activerecord.attributes.isolation.plasm_proc_amount")
    config.columns[:plasm_proc_amount].options = {size: 3, maxlength: 3}

    config.columns[:plasm_proc_bootle].label = I18n.t("activerecord.attributes.isolation.plasm_proc_bootle")
    config.columns[:plasm_proc_bootle].options = {maxlength: 30}

    config.columns[:plasm_proc_store].label = I18n.t("activerecord.attributes.isolation.plasm_proc_store")
    config.columns[:plasm_proc_store].options = {maxlength: 30}

    config.columns[:plasm_ac_amount].label = I18n.t("activerecord.attributes.isolation.plasm_ac_amount")
    config.columns[:plasm_ac_amount].options = {size: 3, maxlength: 3}

    config.columns[:plasm_ac_bootle].label = I18n.t("activerecord.attributes.isolation.plasm_ac_bootle")
    config.columns[:plasm_ac_bootle].options = {maxlength: 30}

    config.columns[:plasm_ac_store].label = I18n.t("activerecord.attributes.isolation.plasm_ac_store")
    config.columns[:plasm_ac_store].options = {maxlength: 30}

    config.columns[:defect_aids].label = I18n.t("activerecord.attributes.isolation.defect_aids")
    config.columns[:defect_aids].form_ui = :select
    config.columns[:defect_aids].options = {options: [["", ""],
                                                      [I18n.t("for_select.defect.minus"), "false"],
                                                      [I18n.t("for_select.defect.plus"), "true"]]}
    config.columns[:defect_aids].required = true

    config.columns[:defect_syph].label = I18n.t("activerecord.attributes.isolation.defect_syph")
    config.columns[:defect_syph].form_ui = :select
    config.columns[:defect_syph].options = {options: [["", ""],
                                                      [I18n.t("for_select.defect.minus"), "false"],
                                                      [I18n.t("for_select.defect.plus"), "true"]]}
    config.columns[:defect_syph].required = true

    config.columns[:defect_hep_c].label = I18n.t("activerecord.attributes.isolation.defect_hep_c")
    config.columns[:defect_hep_c].form_ui = :select
    config.columns[:defect_hep_c].options = {options: [["", ""],
                                                       [I18n.t("for_select.defect.minus"), "false"],
                                                       [I18n.t("for_select.defect.plus"), "true"]]}
    config.columns[:defect_hep_c].required = true

    config.columns[:defect_hep_b].label = I18n.t("activerecord.attributes.isolation.defect_hep_b")
    config.columns[:defect_hep_b].form_ui = :select
    config.columns[:defect_hep_b].options = {options: [["", ""],
                                                       [I18n.t("for_select.defect.minus"), "false"],
                                                       [I18n.t("for_select.defect.plus"), "true"]]}
    config.columns[:defect_hep_b].required = true

    config.columns[:wr_defect_date].label = I18n.t("activerecord.attributes.isolation.wr_defect_date")
    config.columns[:wr_defect_date].options = {size: 10, maxlength: 10}
    config.columns[:wr_defect_date].required = true

    config.columns[:rep_exam_date].label = I18n.t("activerecord.attributes.isolation.rep_exam_date")
    config.columns[:rep_exam_date].options = {size: 10, maxlength: 10}
    config.columns[:rep_exam_date].required = true

    config.columns[:end_quar_date].label = I18n.t("activerecord.attributes.isolation.end_quar_date")
    config.columns[:end_quar_date].options = {size: 10, maxlength: 10}
    config.columns[:end_quar_date].required = true

    config.columns[:give_dispatch].label = I18n.t("activerecord.attributes.isolation.give_dispatch")
    config.columns[:give_dispatch].form_ui = :select
    config.columns[:give_dispatch].options = {options: [["", ""],
                                                        [I18n.t("for_select.give.minus"), "false"],
                                                        [I18n.t("for_select.give.plus"), "true"]]}
    config.columns[:give_dispatch].required = true

    config.columns[:give_fraction].label = I18n.t("activerecord.attributes.isolation.give_fraction")
    config.columns[:give_fraction].form_ui = :select
    config.columns[:give_fraction].options = {options: [["", ""],
                                                        [I18n.t("for_select.give.minus"), "false"],
                                                        [I18n.t("for_select.give.plus"), "true"]]}
    config.columns[:give_fraction].required = true

    config.columns[:give_store].label = I18n.t("activerecord.attributes.isolation.give_store")
    config.columns[:give_store].form_ui = :select
    config.columns[:give_store].options = {options: [["", ""],
                                                     [I18n.t("for_select.give.minus"), "false"],
                                                     [I18n.t("for_select.give.plus"), "true"]]}
    config.columns[:give_store].required = true

    config.create.columns.add_subgroup I18n.t("isolation.group_ag") do |ag|
      ag.add :plasm_ag_amount, :plasm_ag_bootle, :plasm_ag_store
    end
    config.create.columns.add_subgroup I18n.t("isolation.group_krio") do |krio|
      krio.add :plasm_krio_amount, :plasm_krio_bootle, :plasm_krio_store
    end
    config.create.columns.add_subgroup I18n.t("isolation.group_proc") do |proc|
      proc.add :plasm_proc_amount, :plasm_proc_bootle, :plasm_proc_store
    end
    config.create.columns.add_subgroup I18n.t("isolation.group_ac") do |ac|
      ac.add :plasm_ac_amount, :plasm_ac_bootle, :plasm_ac_store
    end
    config.create.columns.add_subgroup I18n.t("isolation.group_defect") do |defect|
      defect.add :defect_aids, :defect_syph, :defect_hep_c, :defect_hep_b
    end
    config.create.columns.add_subgroup I18n.t("isolation.group_date") do |date|
      date.add :wr_defect_date, :rep_exam_date, :end_quar_date
    end
    config.create.columns.add_subgroup I18n.t("isolation.group_give") do |give|
      give.add :give_dispatch, :give_fraction, :give_store
    end

    config.update.columns.add_subgroup I18n.t("isolation.group_ag") do |ag|
      ag.add :plasm_ag_amount, :plasm_ag_bootle, :plasm_ag_store
    end
    config.update.columns.add_subgroup I18n.t("isolation.group_krio") do |krio|
      krio.add :plasm_krio_amount, :plasm_krio_bootle, :plasm_krio_store
    end
    config.update.columns.add_subgroup I18n.t("isolation.group_proc") do |proc|
      proc.add :plasm_proc_amount, :plasm_proc_bootle, :plasm_proc_store
    end
    config.update.columns.add_subgroup I18n.t("isolation.group_ac") do |ac|
      ac.add :plasm_ac_amount, :plasm_ac_bootle, :plasm_ac_store
    end
    config.update.columns.add_subgroup I18n.t("isolation.group_defect") do |defect|
      defect.add :defect_aids, :defect_syph, :defect_hep_c, :defect_hep_b
    end
    config.update.columns.add_subgroup I18n.t("isolation.group_date") do |date|
      date.add :wr_defect_date, :rep_exam_date, :end_quar_date
    end
    config.update.columns.add_subgroup I18n.t("isolation.group_give") do |give|
      give.add :give_dispatch, :give_fraction, :give_store
    end

    config.show.columns.add_subgroup I18n.t("isolation.group_ag") do |ag|
      ag.add :plasm_ag_amount, :plasm_ag_bootle, :plasm_ag_store
    end
    config.show.columns.add_subgroup I18n.t("isolation.group_krio") do |krio|
      krio.add :plasm_krio_amount, :plasm_krio_bootle, :plasm_krio_store
    end
    config.show.columns.add_subgroup I18n.t("isolation.group_proc") do |proc|
      proc.add :plasm_proc_amount, :plasm_proc_bootle, :plasm_proc_store
    end
    config.show.columns.add_subgroup I18n.t("isolation.group_ac") do |ac|
      ac.add :plasm_ac_amount, :plasm_ac_bootle, :plasm_ac_store
    end
    config.show.columns.add_subgroup I18n.t("isolation.group_defect") do |defect|
      defect.add :defect_aids, :defect_syph, :defect_hep_c, :defect_hep_b
    end
    config.show.columns.add_subgroup I18n.t("isolation.group_date") do |date|
      date.add :wr_defect_date, :rep_exam_date, :end_quar_date
    end
    config.show.columns.add_subgroup I18n.t("isolation.group_give") do |give|
      give.add :give_dispatch, :give_fraction, :give_store
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

  def before_create_save(record)
    record.visit_id = params[:visit_id]
  end

end