class CreateFgls < ActiveRecord::Migration

  def change
    create_table(:fgls) do |t|
      t.integer  :code,                         :null => false
      t.integer  :f_value_code,                 :null => true, :default => nil
      t.integer  :glossary_code,                :null => true, :default => nil
      t.string   :name,          :limit => 255, :null => true, :default => nil
      t.datetime :date_begin,                   :null => true, :default => nil
      t.datetime :date_end,                     :null => true, :default => nil
      t.timestamps
    end

    add_index(:fgls, :code,                                  :unique => true, :name => "pk_fgl")
    add_index(:fgls, [:f_value_code, :glossary_code, :name], :unique => true, :name => "unique_fgl_idx")

    add_index(:fgls, :glossary_code, :name => "ix_fgl")
  end

end