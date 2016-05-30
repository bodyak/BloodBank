class CreateCardBloods < ActiveRecord::Migration
  def change
    create_table(:card_bloods) do |t|
      t.integer :cdoc,                   :null => true, :default => nil
      t.integer :ckey,                   :null => true, :default => nil
      t.string  :pole_1, :limit => 5000, :null => true, :default => nil
      t.string  :pole_2, :limit => 100,  :null => true, :default => nil
      t.string  :pole_3, :limit => 100,  :null => true, :default => nil
      t.string  :pole_4, :limit => 5000, :null => true, :default => nil
      t.string  :pole_5, :limit => 5000, :null => true, :default => nil
      t.string  :pole_6, :limit => 5000, :null => true, :default => nil
      t.string  :pole_7, :limit => 5000, :null => true, :default => nil
      t.timestamps
    end
  end
end