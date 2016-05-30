# -*- encoding : utf-8 -*-

class CreateRegNameInGlossaries < ActiveRecord::Migration

  def self.up
    glossaries = [[Visit, "ПІБ реєстратора", "reg_name_id", "string", RegName]]
    glossaries.each do |glossary|
      Glossary.create({:name => glossary[1], :name_type => glossary[4].to_s, :format_value => glossary[3]},
                      :without_protection => true)
    end
    commit_db_transaction
  end

end