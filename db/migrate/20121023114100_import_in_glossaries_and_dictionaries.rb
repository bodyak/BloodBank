# -*- encoding : utf-8 -*-

class ImportInGlossariesAndDictionaries < ActiveRecord::Migration

  def self.up
    glossaries = [[Donor,         "Категорія донора",                              "cat_donor_id",        "string", CatDonor       ],
                  [Donor,         "Найменування медичного закладу де здавав кров", "org_donate_id",       "string", OrgDonate      ],
                  [Donor,         "Зав.відділом формування донорських кадрів",     "doctor_chief_id",     "string", DoctorChief    ],
                  [Donor,         "Група крові",                                   "blood_group_id",      "string", BloodGroup     ],
                  [Donor,         "Rh-фактор",                                     "rh_factor_id",        "string", RhFactor       ],
                  [Donor,         "HLA-фактор",                                    "hla_factor_id",       "string", HlaFactor      ],
                  [Donor,         "Країна",                                        "country_id",          "string", Country        ],
                  [Donor,         "Область",                                       "region_id",           "string", Region         ],
                  [Donor,         "Район",                                         "district_id",         "string", District       ],
                  [Donor,         "Населений пункт",                               "village_id",          "string", Village        ],
                  [DonorDocument, "Документ",                                      "doc_id",              "string", Doc            ],
                  [DonorDefect,   "Джерело даних про брак(заклад)",                "defect_org_id",       "string", DefectOrg      ],
                  [DonorDefect,   "Причина брака",                                 "defect_cause_id",     "string", DefectCause    ],
                  [Visit,         "Адреса організації де здавав кров",             "org_address_id",      "string", OrgAddress     ],
                  [Visit,         "Місце прийому донора",                          "reception_id",        "string", Reception      ],
                  [Visit,         "Ким направлений(лікарський заклад)",            "send_org_id",         "string", SendOrg        ],
                  [Visit,         "Ким направлений(населений пункт)",              "send_village_id",     "string", Village        ],
                  [Visit,         "Ким направлений(відділ)",                       "send_dep_id",         "string", SendDep        ],
                  [Visit,         "Мета звернення",                                "target_id",           "string", Target         ],
                  [Visit,         "Мета звернення(для кого здає кров)",            "target_someone_id",   "string", TargetSomeone  ],
                  [Visit,         "Кров придатна",                                 "blood_for_id",        "string", BloodFor       ],
                  [Visit,         "Контроль Rh фактора",                           "rh_control_id",       "string", RhControl      ],
                  [Visit,         "ПІБ лікаря-лаборанта",                          "doctor_test_id",      "string", DoctorTest     ],
                  [Visit,         "ПІБ лікаря-дерматовенеролога",                  "doctor_skin_id",      "string", DoctorSkin     ],
                  [Visit,         "ПІБ лікаря-терапевта",                          "doctor_therapist_id", "string", DoctorTherapist],
                  [Visit,         "ПІБ лікаря який здійснював забір крові",        "doctor_donation_id",  "string", DoctorDonation ],
                  [Visit,         "Вид забору крові",                              "donation_mode_id",    "string", DonationMode   ],
                  [Visit,         "Тип забору крові",                              "donation_type_id",    "string", DonationType   ],
                  [Visit,         "Вид упаковки",                                  "type_packing_id",     "string", TypePacking    ]]
    glossaries.each do |glossary|
      if Glossary.find_by_name_type(glossary[4].to_s).blank?
        Glossary.create({:name => glossary[1], :name_type => glossary[4].to_s, :format_value => glossary[3]},
                        :without_protection => true)
        commit_db_transaction
        glossary_id = Glossary.last.id
      else
        glossary_id = Glossary.find_by_name_type(glossary[4].to_s).id
      end
      glossary_values = glossary[0].order("#{glossary[2]}").pluck("#{glossary[2]}").uniq - [nil]
      glossary_values.each do |value|
        glossary[4].create({:glossary_id => glossary_id, :value_name => value},
                          :without_protection => true)
      end
      commit_db_transaction
      dictionary_values = Dictionary.where(:glossary_id => glossary_id).select([:id, :value_name])
      dictionary_values.each do |value|
        glossary[0].where("#{glossary[2]} = '#{value.value_name}'").update_all("#{glossary[2]} = #{value.id}")
      end
      glossary[0].connection.execute("ALTER TABLE #{glossary[0].table_name} ALTER COLUMN #{glossary[2]} TYPE integer USING #{glossary[2]}::integer")
    end
  end

  def self.down
    Glossary.delete_all
    Dictionary.delete_all
  end

end