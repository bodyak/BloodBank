class CreateActions < ActiveRecord::Migration

  def change
    create_table(:actions) do |t|
      t.integer  :pro_code,                     :null => false
      t.integer  :pro_use_rcode,                :null => true,  :default => nil
      t.integer  :tech_code,                    :null => true,  :default => nil
      t.string   :pro_com,       :limit => 255, :null => true,  :default => nil
      t.string   :pro_name,      :limit => 255, :null => true,  :default => nil
      t.datetime :pro_time,                     :null => true,  :default => nil
      t.timestamps
    end

    add_index(:actions, :pro_code, :unique => true, :name => "pk_process")

    add_index(:actions, :tech_code, :name => "ix_process")
  end

end