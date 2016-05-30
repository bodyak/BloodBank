class CreateDocuments < ActiveRecord::Migration

  def change
    create_table(:documents) do |t|
      t.integer  :doc_code,                     :null => false
      t.integer  :card,                         :null => true,  :default => nil
      t.integer  :card_code,                    :null => true,  :default => nil
      t.string   :card_set_id,   :limit => 255, :null => true,  :default => nil
      t.integer  :category_code,                :null => true,  :default => nil
      t.integer  :ch_name_code,                 :null => true,  :default => nil
      t.datetime :ch_name_date,                 :null => true,  :default => nil
      t.string   :doc_com,       :limit => 255, :null => true,  :default => nil
      t.datetime :doc_date,                     :null => true,  :default => nil
      t.string   :doc_name,      :limit => 255, :null => true,  :default => nil
      t.string   :doc_no,        :limit => 255, :null => true,  :default => nil
      t.string   :doc_type,      :limit => 255, :null => true,  :default => nil
      t.integer  :empl_code,                    :null => true,  :default => nil
      t.integer  :folder_code,                  :null => true,  :default => nil
      t.timestamps
    end

    add_index(:documents, :doc_code, :unique => true, :name => "pk_document")

    add_index(:documents, :category_code, :name => "cc_d")
    add_index(:documents, :doc_name,      :name => "dn_d")
    add_index(:documents, :folder_code,   :name => "ix_document")
  end

end