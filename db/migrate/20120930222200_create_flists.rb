class CreateFlists < ActiveRecord::Migration

  def change
    create_table(:flists) do |t|
      t.integer :ckey,                         :null => false
      t.integer :fnum,                         :null => false
      t.string  :fcapt,         :limit => 255, :null => true,  :default => nil
      t.string  :fcsource,      :limit => 255, :null => true,  :default => nil
      t.integer :fcwidth,                      :null => true,  :default => nil
      t.string  :fformat,       :limit => 255, :null => true,  :default => nil
      t.string  :field_key,     :limit => 255, :null => true,  :default => nil
      t.integer :field_process,                :null => true,  :default => nil
      t.integer :fleft,                        :null => true,  :default => nil
      t.integer :fread,                        :null => true,  :default => nil
      t.integer :ftab,                         :null => true,  :default => nil
      t.integer :fthight,                      :null => true,  :default => nil
      t.integer :ftop,                         :null => true,  :default => nil
      t.integer :ftwidth,                      :null => true,  :default => nil
      t.integer :ftype,                        :null => true,  :default => nil
      t.integer :fwrite,                       :null => true,  :default => nil
      t.integer :table_index,                  :null => false
      t.integer :sub_index,                    :null => false
      t.string  :font_style,    :limit => 255, :null => true,  :default => nil
      t.string  :fattrib,       :limit => 255, :null => true,  :default => nil
      t.integer :fcaptvisible,                 :null => true,  :default => nil
      t.timestamps
    end

    add_index(:flists, [:ckey, :fnum, :sub_index], :unique => true, :name => "pk_flist")

    add_index(:flists, [:ckey, :field_key],                 :name => "ix_flist")
    add_index(:flists, [:ckey, :field_key, :field_process], :name => "ix_flist_1")
  end

end