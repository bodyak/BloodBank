require "migration_helper"
require "csv"

class ImportInCard < ActiveRecord::Migration

  include MigrationHelper

  def self.up
    CSV.foreach(File.join(Rails.root, "doc/Blood/Csv/dbo_RC_1.csv"), :encoding => 'CP1251',
                                                                     :headers => :first_row,
                                                                     :col_sep => ';',
                                                                     :quote_char => '"') do |row|
      Card.create({:cdoc     => row[0],
                   :fnum_1   => rewrite_null(row[1]),
                   :fnum_2   => rewrite_null(row[2]),
                   :fnum_3   => row[3],
                   :fnum_4   => rewrite_null(row[4]),
                   :fnum_5   => rewrite_null(row[5]),
                   :fnum_6   => rewrite_null(row[6]),
                   :fnum_7   => rewrite_null(row[7]),
                   :fnum_8   => rewrite_null(row[8]),
                   :fnum_9   => rewrite_null(row[9]),
                   :fnum_10  => rewrite_null(row[10]),
                   :fnum_11  => rewrite_null(row[11]),
                   :fnum_12  => rewrite_null(row[12]),
                   :fnum_13  => rewrite_null(row[13]),
                   :fnum_14  => rewrite_null(row[14]),
                   :fnum_15  => rewrite_null(row[15]),
                   :fnum_16  => rewrite_null(row[16]),
                   :fnum_17  => rewrite_null(row[17]),
                   :fnum_18  => rewrite_null(row[18]),
                   :fnum_19  => rewrite_null(row[19]),
                   :fnum_20  => row[20],
                   :fnum_21  => rewrite_null(row[21]),
                   :fnum_22  => rewrite_null(row[22]),
                   :fnum_23  => rewrite_null(row[23]),
                   :fnum_24  => row[24],
                   :fnum_25  => rewrite_null(row[25]),
                   :fnum_26  => rewrite_null(row[26]),
                   :fnum_27  => rewrite_null(row[27]),
                   :fnum_28  => rewrite_null(row[28]),
                   :fnum_29  => rewrite_null(row[29]),
                   :fnum_30  => rewrite_null(row[30]),
                   :fnum_31  => rewrite_null(row[31]),
                   :fnum_32  => rewrite_null(row[32]),
                   :fnum_33  => rewrite_null(row[33]),
                   :fnum_34  => rewrite_null(row[34]),
                   :fnum_35  => rewrite_null(row[35]),
                   :fnum_36  => rewrite_null(row[36]),
                   :fnum_37  => rewrite_null(row[37]),
                   :fnum_38  => rewrite_null(row[38]),
                   :fnum_39  => row[39],
                   :fnum_40  => rewrite_null(row[40]),
                   :fnum_41  => rewrite_null(row[41]),
                   :fnum_42  => rewrite_null(row[42]),
                   :fnum_43  => rewrite_null(row[43]),
                   :fnum_44  => rewrite_null(row[44]),
                   :fnum_45  => rewrite_null(row[45]),
                   :fnum_46  => rewrite_null(row[46]),
                   :fnum_47  => rewrite_null(row[47]),
                   :fnum_48  => rewrite_null(row[48]),
                   :fnum_49  => rewrite_null(row[49]),
                   :fnum_50  => rewrite_null(row[50]),
                   :fnum_51  => rewrite_null(row[51]),
                   :fnum_52  => rewrite_null(row[52]),
                   :fnum_53  => rewrite_null(row[53]),
                   :fnum_54  => rewrite_null(row[54]),
                   :fnum_55  => rewrite_null(row[55]),
                   :fnum_56  => rewrite_null(row[56]),
                   :fnum_57  => rewrite_null(row[57]),
                   :fnum_58  => rewrite_null(row[58]),
                   :fnum_59  => rewrite_null(row[59]),
                   :fnum_60  => rewrite_null(row[60]),
                   :fnum_61  => rewrite_null(row[61]),
                   :fnum_62  => rewrite_null(row[62]),
                   :fnum_63  => rewrite_null(row[63]),
                   :fnum_64  => rewrite_null(row[64]),
                   :fnum_65  => rewrite_null(row[65]),
                   :fnum_66  => rewrite_null(row[66]),
                   :fnum_67  => rewrite_null(row[67]),
                   :fnum_68  => rewrite_null(row[68]),
                   :fnum_69  => rewrite_null(row[69]),
                   :fnum_70  => rewrite_null(row[70]),
                   :fnum_71  => rewrite_null(row[71]),
                   :fnum_72  => rewrite_null(row[72]),
                   :fnum_73  => rewrite_null(row[73]),
                   :fnum_74  => rewrite_null(row[74]),
                   :fnum_75  => rewrite_null(row[75]),
                   :fnum_76  => rewrite_null(row[76]),
                   :fnum_77  => rewrite_null(row[77]),
                   :fnum_78  => rewrite_null(row[78]),
                   :fnum_79  => rewrite_null(row[79]),
                   :fnum_80  => rewrite_null(row[80]),
                   :fnum_81  => rewrite_null(row[81]),
                   :fnum_82  => rewrite_null(row[82]),
                   :fnum_83  => rewrite_null(row[83]),
                   :fnum_84  => rewrite_null(row[84]),
                   :fnum_85  => rewrite_null(row[85]),
                   :fnum_86  => rewrite_null(row[86]),
                   :fnum_87  => rewrite_null(row[87]),
                   :fnum_88  => rewrite_null(row[88]),
                   :fnum_89  => rewrite_null(row[89]),
                   :fnum_90  => rewrite_null(row[90]),
                   :fnum_91  => rewrite_null(row[91]),
                   :fnum_92  => rewrite_null(row[92]),
                   :fnum_93  => rewrite_null(row[93]),
                   :fnum_94  => rewrite_null(row[94]),
                   :fnum_95  => rewrite_null(row[95]),
                   :fnum_96  => rewrite_null(row[96]),
                   :fnum_97  => rewrite_null(row[97]),
                   :fnum_98  => rewrite_null(row[98]),
                   :fnum_99  => rewrite_null(row[99]),
                   :fnum_101 => rewrite_null(row[100]),
                   :fnum_102 => rewrite_null(row[101]),
                   :fnum_103 => rewrite_null(row[102]),
                   :fnum_104 => rewrite_null(row[103]),
                   :fnum_105 => row[104],
                   :fnum_106 => rewrite_null(row[105])},
                  :without_protection => true)
      commit_db_transaction
    end
  end

  def self.down
    Card.delete_all
  end

end