class CreateVisitations < ActiveRecord::Migration

  def change
    create_table(:visitations) do |t|
      t.references :donor
      t.string     :card_number,         limit: 30, null: false
      t.date       :reg_date,            null: false
      t.decimal    :code_org,            precision: 10, scale: 0, null: false
      t.integer    :org_reception_id
      t.integer    :org_address_id
      t.integer    :reception_id,        null: false
      t.integer    :send_village_id
      t.integer    :send_org_id
      t.integer    :send_dep_id
      t.date       :visit_date,          null: false
      t.integer    :target_id
      t.boolean    :type_payment,        null: false
      t.integer    :blood_group_id,      null: false
      t.integer    :rh_factor_id,        null: false
      t.string     :donor_name,          limit: 100, null: false
      t.boolean    :gender,              null: false
      t.date       :birth_date
      t.decimal    :age,                 precision: 3, scale: 0, null: false
      t.string     :post_code,           limit: 20
      t.integer    :country_id
      t.integer    :region_id
      t.integer    :district_id
      t.boolean    :type_village
      t.integer    :village_id
      t.string     :address,             limit: 100
      t.string     :work,                limit: 100
      t.string     :job,                 limit: 100
      t.integer    :reg_name_id,         null: false
      t.integer    :control_blood_id
      t.integer    :rh_control_id
      t.boolean    :ill_hepatitis,       null: false
      t.boolean    :ill_tb,              null: false
      t.boolean    :ill_syphilis,        null: false
      t.boolean    :ill_mal,             null: false
      t.boolean    :operation,           null: false
      t.boolean    :transfusion,         null: false
      t.boolean    :infection,           null: false
      t.boolean    :dermis,              null: false
      t.boolean    :dermis_doctor,       null: false
      t.integer    :doctor_skin_id
      t.decimal    :pulse,               precision: 3, scale: 0
      t.decimal    :sys_pressure,        precision: 3, scale: 0
      t.decimal    :dias_pressure,       precision: 3, scale: 0
      t.decimal    :allow_amount,        precision: 3, scale: 0
      t.boolean    :therapist_doctor,    null: false
      t.integer    :doctor_therapist_id
      t.integer    :defect_cause_id
      t.time       :deleted_at
      t.timestamps
    end
  end

end