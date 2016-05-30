# -*- encoding : utf-8 -*-

class CreateOrgInspectInGlossaries < ActiveRecord::Migration

  def self.up
    glossaries = [['Організація післяобстеження', 'integer', OrgInspect]]
    glossaries.each do |glossary|
      Glossary.create({name: glossary[0], name_type: glossary[2].to_s, format_value: glossary[1]},
                      without_protection: true)
    end
    commit_db_transaction
  end

end