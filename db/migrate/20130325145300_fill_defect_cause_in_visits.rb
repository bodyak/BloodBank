# -*- encoding : utf-8 -*-

class FillDefectCauseInVisits < ActiveRecord::Migration

  def self.up
    glossaries = [[Visit, "Причина відбраковки", "defect_cause_id", "string", DefectCause]]
    glossaries.each do |glossary|
      dictionary_values = Dictionary.where(:type => glossary[4]).select([:id, :value_name])
      dictionary_values.each do |value|
        glossary[0].where("#{glossary[2]} = '#{value.value_name}'").update_all("#{glossary[2]} = #{value.id}")
      end
    end
    commit_db_transaction
  end

end