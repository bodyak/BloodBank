class CreateSkins < ActiveRecord::Migration

  def change
    create_table(:skins) do |t|
      t.decimal    :card_number,       precision: 16, scale: 0, null: false # Номер картки
      t.string     :first_name,        limit: 30, null: false               # Імя
      t.string     :middle_name,       limit: 30, null: false               # По батькові
      t.string     :last_name,         limit: 30, null: false               # Призвіще
      t.string     :post_code,         limit: 20                            # Індекс
      t.integer    :country_id                                              # Країна
      t.integer    :region_id                                               # Регіон(область)
      t.integer    :district_id                                             # Район
      t.integer    :village_id                                              # Населений пункт
      t.string     :address,           limit: 100                           # Адреса
      t.integer    :defect_skin_id,    null: false                          # Діагноз
      t.date       :date_dermis_begin, null: false                          # Дата взяття на облік в ШВД
      t.date       :date_dermis_end                                         # Дата зняття з обліку в ШВД
      t.integer    :reg_name_id,       null: false                          # ПІБ реєстратора
      t.time       :deleted_at
      t.timestamps
    end
  end

end