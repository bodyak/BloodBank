class CreateCards < ActiveRecord::Migration

  def change
    create_table(:cards) do |t|
      t.integer :cdoc,     :null => false
      t.text    :fnum_1,   :null => true,  :default => nil
      t.text    :fnum_2,   :null => true,  :default => nil
      t.float   :fnum_3,   :null => true,  :default => nil
      t.text    :fnum_4,   :null => true,  :default => nil
      t.text    :fnum_5,   :null => true,  :default => nil
      t.text    :fnum_6,   :null => true,  :default => nil
      t.text    :fnum_7,   :null => true,  :default => nil
      t.text    :fnum_8,   :null => true,  :default => nil
      t.text    :fnum_9,   :null => true,  :default => nil
      t.text    :fnum_10,  :null => true,  :default => nil
      t.text    :fnum_11,  :null => true,  :default => nil
      t.text    :fnum_12,  :null => true,  :default => nil
      t.text    :fnum_13,  :null => true,  :default => nil
      t.text    :fnum_14,  :null => true,  :default => nil
      t.text    :fnum_15,  :null => true,  :default => nil
      t.text    :fnum_16,  :null => true,  :default => nil
      t.text    :fnum_17,  :null => true,  :default => nil
      t.text    :fnum_18,  :null => true,  :default => nil
      t.text    :fnum_19,  :null => true,  :default => nil
      t.float   :fnum_20,  :null => true,  :default => nil
      t.text    :fnum_21,  :null => true,  :default => nil
      t.text    :fnum_22,  :null => true,  :default => nil
      t.text    :fnum_23,  :null => true,  :default => nil
      t.float   :fnum_24,  :null => true,  :default => nil
      t.text    :fnum_25,  :null => true,  :default => nil
      t.text    :fnum_26,  :null => true,  :default => nil
      t.text    :fnum_27,  :null => true,  :default => nil
      t.text    :fnum_28,  :null => true,  :default => nil
      t.text    :fnum_29,  :null => true,  :default => nil
      t.text    :fnum_30,  :null => true,  :default => nil
      t.text    :fnum_31,  :null => true,  :default => nil
      t.text    :fnum_32,  :null => true,  :default => nil
      t.text    :fnum_33,  :null => true,  :default => nil
      t.text    :fnum_34,  :null => true,  :default => nil
      t.text    :fnum_35,  :null => true,  :default => nil
      t.text    :fnum_36,  :null => true,  :default => nil
      t.text    :fnum_37,  :null => true,  :default => nil
      t.text    :fnum_38,  :null => true,  :default => nil
      t.float   :fnum_39,  :null => true,  :default => nil
      t.text    :fnum_40,  :null => true,  :default => nil
      t.text    :fnum_41,  :null => true,  :default => nil
      t.text    :fnum_42,  :null => true,  :default => nil
      t.text    :fnum_43,  :null => true,  :default => nil
      t.text    :fnum_44,  :null => true,  :default => nil
      t.text    :fnum_45,  :null => true,  :default => nil
      t.text    :fnum_46,  :null => true,  :default => nil
      t.text    :fnum_47,  :null => true,  :default => nil
      t.text    :fnum_48,  :null => true,  :default => nil
      t.text    :fnum_49,  :null => true,  :default => nil
      t.text    :fnum_50,  :null => true,  :default => nil
      t.text    :fnum_51,  :null => true,  :default => nil
      t.text    :fnum_52,  :null => true,  :default => nil
      t.text    :fnum_53,  :null => true,  :default => nil
      t.text    :fnum_54,  :null => true,  :default => nil
      t.text    :fnum_55,  :null => true,  :default => nil
      t.text    :fnum_56,  :null => true,  :default => nil
      t.text    :fnum_57,  :null => true,  :default => nil
      t.text    :fnum_58,  :null => true,  :default => nil
      t.text    :fnum_59,  :null => true,  :default => nil
      t.text    :fnum_60,  :null => true,  :default => nil
      t.text    :fnum_61,  :null => true,  :default => nil
      t.text    :fnum_62,  :null => true,  :default => nil
      t.text    :fnum_63,  :null => true,  :default => nil
      t.text    :fnum_64,  :null => true,  :default => nil
      t.text    :fnum_65,  :null => true,  :default => nil
      t.text    :fnum_66,  :null => true,  :default => nil
      t.text    :fnum_67,  :null => true,  :default => nil
      t.text    :fnum_68,  :null => true,  :default => nil
      t.text    :fnum_69,  :null => true,  :default => nil
      t.text    :fnum_70,  :null => true,  :default => nil
      t.text    :fnum_71,  :null => true,  :default => nil
      t.text    :fnum_72,  :null => true,  :default => nil
      t.text    :fnum_73,  :null => true,  :default => nil
      t.text    :fnum_74,  :null => true,  :default => nil
      t.text    :fnum_75,  :null => true,  :default => nil
      t.text    :fnum_76,  :null => true,  :default => nil
      t.text    :fnum_77,  :null => true,  :default => nil
      t.text    :fnum_78,  :null => true,  :default => nil
      t.text    :fnum_79,  :null => true,  :default => nil
      t.text    :fnum_80,  :null => true,  :default => nil
      t.text    :fnum_81,  :null => true,  :default => nil
      t.text    :fnum_82,  :null => true,  :default => nil
      t.text    :fnum_83,  :null => true,  :default => nil
      t.text    :fnum_84,  :null => true,  :default => nil
      t.text    :fnum_85,  :null => true,  :default => nil
      t.text    :fnum_86,  :null => true,  :default => nil
      t.text    :fnum_87,  :null => true,  :default => nil
      t.text    :fnum_88,  :null => true,  :default => nil
      t.text    :fnum_89,  :null => true,  :default => nil
      t.text    :fnum_90,  :null => true,  :default => nil
      t.text    :fnum_91,  :null => true,  :default => nil
      t.text    :fnum_92,  :null => true,  :default => nil
      t.text    :fnum_93,  :null => true,  :default => nil
      t.text    :fnum_94,  :null => true,  :default => nil
      t.text    :fnum_95,  :null => true,  :default => nil
      t.text    :fnum_96,  :null => true,  :default => nil
      t.text    :fnum_97,  :null => true,  :default => nil
      t.text    :fnum_98,  :null => true,  :default => nil
      t.text    :fnum_99,  :null => true,  :default => nil
      t.text    :fnum_101, :null => true,  :default => nil
      t.text    :fnum_102, :null => true,  :default => nil
      t.text    :fnum_103, :null => true,  :default => nil
      t.text    :fnum_104, :null => true,  :default => nil
      t.float   :fnum_105, :null => true,  :default => nil
      t.text    :fnum_106, :null => true,  :default => nil
      t.timestamps
    end

    add_index(:cards, :cdoc, :unique => true, :name => "pk_cdoc")
  end

end