# -*- encoding : utf-8 -*-

class ChangeValueVillage < ActiveRecord::Migration
  def self.up
    values = [[[201, 830], 846, Village],
              [[834], 160, Village],
              [[171], 836, Village],
              [[183, 842], 172, Village],
              [[179], 840, Village],
              [[841, 893], 180, Village],
              [[843], 568, Village],
              [[185], 569, Village],
              [[844], 193, Village],
              [[845], 194, Village],
              [[847], 203, Village],
              [[849], 208, Village],
              [[213], 214, Village],
              [[852], 260, Village],
              [[853], 285, Village],
              [[854], 303, Village],
              [[857], 408, Village],
              [[858], 440, Village],
              [[443], 859, Village],
              [[863], 504, Village],
              [[864], 506, Village],
              [[865], 525, Village],
              [[866], 539, Village],
              [[867], 549, Village],
              [[868], 550, Village],
              [[869], 554, Village],
              [[870], 556, Village],
              [[871], 559, Village],
              [[872], 572, Village],
              [[873], 594, Village],
              [[874], 600, Village],
              [[875], 603, Village],
              [[877], 635, Village],
              [[619], 398, Village],
              [[336], 207, Village],
              [[878], 636, Village],
              [[879], 644, Village],
              [[880], 646, Village],
              [[882], 674, Village],
              [[883], 701, Village],
              [[884], 702, Village],
              [[885], 703, Village],
              [[704], 664, Village],
              [[886], 705, Village],
              [[708], 888, Village],
              [[889], 740, Village],
              [[890], 881, Village],
              [[892], 887, Village]]
    values.each do |value|
      value[2].reflect_on_all_associations(:has_many).each do |association|
        foreign_key = association.options[:inverse_of].to_s + "_id"
        model = association.options[:class_name].constantize
        value[0].each do |old_value|
          model.update_all "#{foreign_key} = #{value[1]}", "#{foreign_key} = #{old_value}"
          value[2].delete_all("id = #{old_value}")
        end if model.column_names.include?(foreign_key)
      end
    end
  end

end