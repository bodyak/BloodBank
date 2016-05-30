# -*- encoding : utf-8 -*-

class AlterColumnRegName < ActiveRecord::Migration

  def self.up
    glossaries = [[Visit, "ПІБ реєстратора", "reg_name_id", "string", RegName],
                  [Donor, "ПІБ реєстратора", "reg_name_id", "string", RegName]]
    glossaries.each do |glossary|
      glossary[0].connection.execute("ALTER TABLE #{glossary[0].table_name} ALTER COLUMN #{glossary[2]} TYPE integer USING #{glossary[2]}::integer")
    end
    commit_db_transaction
  end

end