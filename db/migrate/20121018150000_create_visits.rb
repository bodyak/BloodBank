class CreateVisits < ActiveRecord::Migration
  def change
    create_table(:visits) do |t|
      t.references :donor
      t.string     :card_number         # fnum_84  Номер картки відвідання
      t.date       :reg_date            # fnum_42  Дата заповнення картки
      t.integer    :code_org            # fnum_91  Код закладу реєстрації
      t.string     :org_reception_id    # fnum_19  Організація, посадові особи якої заповнили картку
      t.string     :org_address_id      # fnum_40  Повна одреса організації яка заповнила картку
      t.string     :reception_id        # fnum_66  Місце прийому
      t.string     :send_village_id     # fnum_95  Населений пункт звідки направлений
      t.string     :send_org_id         # fnum_67  Організація яка направила
      t.string     :send_dep_id         # fnum_96  Відділ організації звідки направлений
      t.date       :visit_date          # fnum_4   Дата відвідання
      t.string     :target_id           # fnum_87  Мета звернення
      t.boolean    :type_payment        # fnum_83  Безоплатна/Платна
      t.string     :target_someone_id   # fnum_92  Чи здавав за родича
      t.string     :blood_for_id        # fnum_26  Кров придатна
      t.string     :type_donation       # fnum_48  Вид донорства
      t.string     :blood_group_id      # fnum_43  Група крові                 (:blood_group)
      t.string     :rh_factor_id        # fnum_51  Резус-фактор                (:rh_factor)
      t.string     :donor_name          # fnum_1   ПІБ                         (:first_name + :middle_name + :last_name)
      t.boolean    :gender              # fnum_2   Стать                       (:gender)
      t.date       :birth_date          # fnum_64  Дата народження             (:birth_date)
      t.integer    :age                 # fnum_3   Вік
      t.string     :post_code           # fnum_7   Індекс                      (:post_code)
      t.string     :country_id          # fnum_5   Країна                      (:country)
      t.string     :region_id           # fnum_8   Регіон(Область)             (:region)
      t.string     :district_id         # fnum_9   Район                       (:district)
      t.boolean    :type_village        # fnum_14  Мешкає у місті/селі         (:type_village)
      t.string     :village_id          # fnum_10  Населений пункт             (:village)
      t.string     :address             # fnum_13  Адреса                      (:address)
      t.string     :work                # fnum_15  Місце роботи                (:work)
      t.string     :job                 # fnum_16  Посада                      (:job)
      t.string     :reg_name_id         # fnum_31  ПІБ реєстратора
      t.string     :control_blood_id    # fnum_23  Контроль групи крові
      t.string     :rh_control_id       # fnum_28  Контроль резус-фактор
      t.integer    :hbs                 #          Гемоглобін
      t.date       :analysis_date       # fnum_34  Дата проведення аналізу
      t.string     :doctor_test_id      # fnum_35  ПІБ лікаря-лаборанта
      t.date       :previous_date       # fnum_11  Дата попереднього давання крові
      t.boolean    :ill_hepatitis       #          Чи хворів на гепатити
      t.boolean    :ill_tb              #          Чи хворів на туберкульоз
      t.boolean    :ill_syphilis        #          Чи хворів на сифіліс
      t.boolean    :ill_mal             #          Чи хворів на малярія
      t.boolean    :operation           #          Чи переносив операції
      t.boolean    :transfusion         #          Чи переносив гемотрансфузії
      t.boolean    :infection           # fnum_38  Чи перебував у контакті з інфекційними хворими
      t.boolean    :dermis              # fnum_37  Чи перебував на обліку з приводу шкірних захворювань
      t.boolean    :dermis_doctor       # fnum_27  Висновок лікаря-дерматовенеролога
      t.string     :doctor_skin_id      # fnum_22  ПІБ лікаря-дерматовенеролога
      t.integer    :pulse               # fnum_24  Пульс
      t.integer    :sys_pressure        # fnum_25  Систолічний тиск
      t.integer    :dias_pressure       # fnum_25  Диастолічний тиск
      t.integer    :allow_amount        # fnum_61  Дозволено здавати
      t.boolean    :therapist_doctor    # fnum_21  Висновок лікаря-терапевта
      t.string     :doctor_therapist_id # fnum_29  ПІБ лікаря-терапевта
      t.string     :defect_cause_id     # fnum_12  Причина відбраковки

      t.date       :date_donation       # fnum_50  Дата кроводачі
      t.string     :doctor_donation_id  # fnum_72  ПІБ відповідального за кроводачу
      t.string     :donation_mode_id    # fnum_65  Вид кроводачі/плазмаферезу
      t.string     :donation_type_id    # fnum_81  Вид забору крові/плазмаферезу
      t.integer    :amount_probe        # fnum_44  Взято крові для дослідження
      t.integer    :amount_dose         # fnum_46  Взято, доза
      t.string     :type_packing_id     # fnum_73  Вид упаковки
      t.string     :bottle_number       # fnum_47  Номер флакона/контейнера
      t.integer    :inspect_bilirubin   # fnum_55  Обстеження на Білірубін
      t.integer    :inspect_alt         # fnum_56  Обстеження на АЛТ
      t.boolean    :inspect_syphilis    # fnum_33  Обстеження на A50(Сифіліс)
      t.date       :date_syphilis       # fnum_63  Дата обстеження на A50(Сифіліс)
      t.boolean    :inspect_hep_c       # fnum_53  Обстеження на B17(Гепатит C)
      t.date       :date_hep_c          # fnum_79  Дата обстеження на B17(Гепатит C)
      t.boolean    :inspect_hep_b       # fnum_54  Обстеження на B16(Гепатит B)
      t.date       :date_hep_b          # fnum_85  Дата обстеження на B16(Гепатит B)
      t.boolean    :inspect_aids        # fnum_57  Обстеження на R75(ВІЛ/СНІД)
      t.date       :date_aids           # fnum_86  Дата обстеження на R75(ВІЛ/СНІД)

      t.timestamps
    end
  end
end