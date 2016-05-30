class CreateCardVals < ActiveRecord::Migration

  def change
    create_table(:card_vals) do |t|
      t.integer :cdoc,                     :null => false
      t.integer :ckey,                     :null => false
      t.integer :fnum,                     :null => false
      t.string  :fval,      :limit => 255, :null => true,  :default => nil
      t.text    :fval_long,                :null => true,  :default => nil
      t.float   :fval_num,                 :null => true,  :default => nil
      t.timestamps
    end

    add_index(:card_vals, [:cdoc, :ckey, :fnum], :unique => true, :name => "pk_cardval")

    add_index(:card_vals, [:ckey, :fnum, :fval],     :name => "ix_cardval")
    add_index(:card_vals, [:ckey, :fnum, :fval_num], :name => "ix_card_val_1")
  end

end