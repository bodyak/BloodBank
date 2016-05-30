class CreateIsolations < ActiveRecord::Migration

  def change
    create_table(:isolations) do |t|
      t.references :visit
      t.decimal    :plasm_ag_amount,   precision: 3, scale: 0, default: 0
      t.string     :plasm_ag_bootle,   limit: 30
      t.string     :plasm_ag_store,    limit: 30
      t.decimal    :plasm_krio_amount, precision: 3, scale: 0, default: 0
      t.string     :plasm_krio_bootle, limit: 30
      t.string     :plasm_krio_store,  limit: 30
      t.decimal    :plasm_proc_amount, precision: 3, scale: 0, default: 0
      t.string     :plasm_proc_bootle, limit: 30
      t.string     :plasm_proc_store,  limit: 30
      t.decimal    :plasm_ac_amount,   precision: 3, scale: 0, default: 0
      t.string     :plasm_ac_bootle,   limit: 30
      t.string     :plasm_ac_store,    limit: 30
      t.boolean    :defect_aids,       null: false, default: false
      t.boolean    :defect_syph,       null: false, default: false
      t.boolean    :defect_hep_c,      null: false, default: false
      t.boolean    :defect_hep_b,      null: false, default: false
      t.date       :wr_defect_date,    null: false
      t.date       :rep_exam_date,     null: false
      t.date       :end_quar_date,     null: false
      t.boolean    :give_dispatch,     null: false, default: false
      t.boolean    :give_fraction,     null: false, default: false
      t.boolean    :give_store,        null: false, default: false
      t.time       :deleted_at
      t.timestamps
    end
  end

end