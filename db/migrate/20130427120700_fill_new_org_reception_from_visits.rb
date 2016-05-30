# -*- encoding : utf-8 -*-

class FillNewOrgReceptionFromVisits < ActiveRecord::Migration

  def self.up
    glossaries = [[Visit, "Організація котра заповнила картку", "org_reception_id", "string", OrgReception]]
    glossaries.each do |glossary|
      Glossary.create({:name => glossary[1], :name_type => glossary[4].to_s, :format_value => glossary[3]},
                      :without_protection => true)
      commit_db_transaction
      glossary_id = Glossary.where(:name_type => glossary[4].to_s).last.id
      glossary_values = glossary[0].order("#{glossary[2]}").pluck("#{glossary[2]}").uniq - [nil]
      glossary_values.each do |value|
        glossary[4].create({:glossary_id => glossary_id, :value_name => value},
                          :without_protection => true)
      end
      commit_db_transaction
      dictionary_values = Dictionary.where(:type => glossary[4]).select([:id, :value_name])
      dictionary_values.each do |value|
        glossary[0].where("#{glossary[2]} = '#{value.value_name}'").update_all("#{glossary[2]} = #{value.id}")
      end
      glossary[0].connection.execute("ALTER TABLE #{glossary[0].table_name} ALTER COLUMN #{glossary[2]} TYPE integer USING #{glossary[2]}::integer")
    end
    commit_db_transaction
  end

end