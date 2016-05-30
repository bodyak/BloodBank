class CreateCardLinks < ActiveRecord::Migration

  def change
    create_table(:card_links) do |t|
      t.integer :ckey,      :null => false
      t.integer :fnum,      :null => false
      t.integer :cdoc,      :null => false
      t.integer :curr_cdoc, :null => false
      t.timestamps
    end

    add_index(:card_links, [:ckey, :fnum, :cdoc, :curr_cdoc], :unique => true, :name => "pk_cardlink")
  end

end