class CreateCardDonors < ActiveRecord::Migration

  def change
    create_table(:card_donors) do |t|
      t.integer :cdoc,    :null => false
      t.text    :fnum_1,  :null => true,  :default => nil
      t.text    :fnum_2,  :null => true,  :default => nil
      t.text    :fnum_3,  :null => true,  :default => nil
      t.text    :fnum_4,  :null => true,  :default => nil
      t.text    :fnum_5,  :null => true,  :default => nil
      t.text    :fnum_6,  :null => true,  :default => nil
      t.text    :fnum_7,  :null => true,  :default => nil
      t.text    :fnum_8,  :null => true,  :default => nil
      t.text    :fnum_9,  :null => true,  :default => nil
      t.float   :fnum_10, :null => true,  :default => nil
      t.text    :fnum_11, :null => true,  :default => nil
      t.text    :fnum_12, :null => true,  :default => nil
      t.text    :fnum_13, :null => true,  :default => nil
      t.text    :fnum_14, :null => true,  :default => nil
      t.text    :fnum_15, :null => true,  :default => nil
      t.text    :fnum_16, :null => true,  :default => nil
      t.text    :fnum_17, :null => true,  :default => nil
      t.text    :fnum_18, :null => true,  :default => nil
      t.text    :fnum_19, :null => true,  :default => nil
      t.text    :fnum_20, :null => true,  :default => nil
      t.text    :fnum_21, :null => true,  :default => nil
      t.text    :fnum_22, :null => true,  :default => nil
      t.text    :fnum_23, :null => true,  :default => nil
      t.text    :fnum_24, :null => true,  :default => nil
      t.text    :fnum_25, :null => true,  :default => nil
      t.text    :fnum_26, :null => true,  :default => nil
      t.text    :fnum_27, :null => true,  :default => nil
      t.text    :fnum_28, :null => true,  :default => nil
      t.float   :fnum_29, :null => true,  :default => nil
      t.text    :fnum_32, :null => true,  :default => nil
      t.text    :fnum_33, :null => true,  :default => nil
      t.text    :fnum_34, :null => true,  :default => nil
      t.text    :fnum_35, :null => true,  :default => nil
      t.text    :fnum_36, :null => true,  :default => nil
      t.text    :fnum_37, :null => true,  :default => nil
      t.text    :fnum_38, :null => true,  :default => nil
      t.text    :fnum_39, :null => true,  :default => nil
      t.text    :fnum_40, :null => true,  :default => nil
      t.text    :fnum_41, :null => true,  :default => nil
      t.text    :fnum_42, :null => true,  :default => nil
      t.text    :fnum_43, :null => true,  :default => nil
      t.text    :fnum_44, :null => true,  :default => nil
      t.text    :fnum_45, :null => true,  :default => nil
      t.text    :fnum_46, :null => true,  :default => nil
      t.text    :fnum_47, :null => true,  :default => nil
      t.text    :fnum_48, :null => true,  :default => nil
      t.text    :fnum_49, :null => true,  :default => nil
      t.text    :fnum_50, :null => true,  :default => nil
      t.float   :fnum_51, :null => true,  :default => nil
      t.text    :fnum_52, :null => true,  :default => nil
      t.text    :fnum_53, :null => true,  :default => nil
      t.text    :fnum_54, :null => true,  :default => nil
      t.text    :fnum_55, :null => true,  :default => nil
      t.text    :fnum_56, :null => true,  :default => nil
      t.float   :fnum_57, :null => true,  :default => nil
      t.text    :fnum_58, :null => true,  :default => nil
      t.text    :fnum_59, :null => true,  :default => nil
      t.text    :fnum_60, :null => true,  :default => nil
      t.text    :fnum_61, :null => true,  :default => nil
      t.text    :fnum_63, :null => true,  :default => nil
      t.text    :fnum_64, :null => true,  :default => nil
      t.text    :fnum_65, :null => true,  :default => nil
      t.text    :fnum_66, :null => true,  :default => nil
      t.text    :fnum_67, :null => true,  :default => nil
      t.text    :fnum_68, :null => true,  :default => nil
      t.text    :fnum_69, :null => true,  :default => nil
      t.text    :fnum_70, :null => true,  :default => nil
      t.text    :fnum_71, :null => true,  :default => nil
      t.text    :fnum_72, :null => true,  :default => nil
      t.text    :fnum_73, :null => true,  :default => nil
      t.text    :fnum_74, :null => true,  :default => nil
      t.text    :fnum_75, :null => true,  :default => nil
      t.text    :fnum_76, :null => true,  :default => nil
      t.text    :fnum_77, :null => true,  :default => nil
      t.text    :fnum_78, :null => true,  :default => nil
      t.text    :fnum_79, :null => true,  :default => nil
      t.text    :fnum_80, :null => true,  :default => nil
      t.timestamps
    end

    add_index(:card_donors, :cdoc, :unique => true, :name => "pk_cdoc_2")
  end

end