# -*- encoding : utf-8 -*-

class FillVisitsFromDictionaries < ActiveRecord::Migration

  def self.up
    glossaries = [[Visit, "Група крові",          "blood_group_id",   "string", BloodGroup],
                  [Visit, "Rh-фактор",            "rh_factor_id",     "string", RhFactor  ],
                  [Visit, "Країна",               "country_id",       "string", Country   ],
                  [Visit, "Регіон(Область)",      "region_id",        "string", Region    ],
                  [Visit, "Район",                "district_id",      "string", District  ],
                  [Visit, "Населений пункт",      "village_id",       "string", Village   ],
                  [Visit, "Контроль групи крові", "control_blood_id", "string", BloodGroup]]
    glossaries.each do |glossary|
      dictionary_values = Dictionary.where(:type => glossary[4]).select([:id, :value_name])
      dictionary_values.each do |value|
        glossary[0].where("#{glossary[2]} = '#{value.value_name}'").update_all("#{glossary[2]} = #{value.id}")
      end
      glossary[0].connection.execute("ALTER TABLE #{glossary[0].table_name} ALTER COLUMN #{glossary[2]} TYPE integer USING #{glossary[2]}::integer")
      commit_db_transaction
    end
  end

end