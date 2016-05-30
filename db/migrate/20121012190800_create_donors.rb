class CreateDonors < ActiveRecord::Migration
  def change
    create_table(:donors) do |t|
      t.integer    :card_number     # cdoc     Номер картки донора
      t.integer    :code_org        # fnum_60  Код закладу реєстрації
      t.string     :cat_donor_id    # fnum_7   Категорія донора
      t.string     :org_donate_id   # fnum_1   Місце прийому при першій кроводачі
      t.date       :visit_date      # fnum_2   Дата заповнення картки
      t.date       :reg_date        # fnum_2   Дата реєстрації донора
      t.string     :reg_name_id     # fnum_39  ПІБ реєстратора
      t.string     :doctor_chief_id # fnum_41  ПІБ зав.відділом формування донорських кадрів
      t.string     :blood_group_id  # fnum_22  Група крові
      t.string     :rh_factor_id    # fnum_23  Резус-фактор
      t.string     :hla_factor_id   # fnum_24  HLA фактор
      t.string     :first_name      # fnum_4   Імя
      t.string     :middle_name     # fnum_5   По батькові
      t.string     :last_name       # fnum_3   Призвіще
      t.boolean    :gender          # fnum_6   Стать
      t.date       :birth_date      # fnum_8   Дата народження
      t.string     :post_code       # fnum_11  Індекс
      t.string     :country_id      # fnum_12  Країна
      t.string     :region_id       # fnum_13  Регіон(область)
      t.string     :district_id     # fnum_14  Район
      t.boolean    :type_village    # fnum_17  Мешкає у місті/селі
      t.string     :village_id      # fnum_15  Населений пункт
      t.string     :address         # fnum_16  Адреса
      t.string     :tel_home        # fnum_20  Домашній телефон
      t.string     :work            # fnum_18  Місце роботи
      t.string     :job             # fnum_19  Посада
      t.string     :tel_work        # fnum_21  Телефон робочий
      t.timestamps
    end
  end
end