# -*- encoding : utf-8 -*-

class ChangeValueInDictionaries < ActiveRecord::Migration
  def self.up
    values = [[[1058], 765, DefectCause],
              [[1063], 768, DefectCause],
              [[772], 1048, DefectCause],
              [[773], 1067, DefectCause],
              [[1070], 779, DefectCause],
              [[1072], 792, DefectCause],
              [[1073], 793, DefectCause],
              [[794], 1074, DefectCause],
              [[1075], 795, DefectCause],
              [[126], 125, District],
              [[1024], 1023, DoctorDonation],
              [[987], 988, DoctorSkin],
              [[45, 47, 49, 50, 51, 52, 53, 54, 55, 60, 61, 62, 63, 64, 65, 66, 67, 68], 44, HlaFactor],
              [[56, 57, 58, 59, 69, 70, 71, 72], 46, HlaFactor],
              [[75, 76], 74, HlaFactor],
              [[5], 6, OrgDonate],
              [[1076], 1077, OrgReception],
              [[956], 955, RhControl],
              [[895], 894, SendDep],
              [[898], 897, SendDep],
              [[901], 900, SendDep],
              [[902], 904, SendDep],
              [[903], 905, SendDep],
              [[906], 907, SendDep],
              [[908], 909, SendDep],
              [[921], 922, SendDep],
              [[927], 928, SendDep],
              [[929], 930, SendDep],
              [[935], 933, SendDep],
              [[824], 825, SendOrg],
              [[831, 833, 139], 832, Village],
              [[839, 178], 838, Village],
              [[850, 257, 258], 851, Village],
              [[861, 478], 860, Village],
              [[618], 876, Village],
              [[656], 881, Village],
              [[707], 887, Village],
              [[152], 167, Village],
              [[837], 172, Village],
              [[188], 187, Village],
              [[199], 198, Village],
              [[205], 204, Village],
              [[247], 174, Village],
              [[140], 253, Village],
              [[261], 262, Village],
              [[284], 285, Village],
              [[307], 306, Village],
              [[144], 332, Village],
              [[335], 334, Village],
              [[361], 360, Village],
              [[153], 420, Village],
              [[470], 469, Village],
              [[502, 862], 503, Village],
              [[534], 533, Village],
              [[536], 537, Village],
              [[616], 206, Village],
              [[623, 624], 622, Village],
              [[638], 637, Village],
              [[666, 667], 673, Village],
              [[687], 686, Village]]
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