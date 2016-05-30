class CreateDocHists < ActiveRecord::Migration

  def change
    create_table(:doc_hists) do |t|
      t.string   :mid,           :limit => 160,  :null => false
      t.string   :act_path,      :limit => 255,  :null => true,  :default => nil
      t.integer  :actual,                        :null => true,  :default => nil
      t.integer  :busy,                          :null => true,  :default => nil
      t.integer  :category_code,                 :null => true,  :default => nil
      t.datetime :complete_date,                 :null => true,  :default => nil
      t.integer  :crypt,                         :null => true,  :default => nil
      t.integer  :doc_code,                      :null => true,  :default => nil
      t.string   :doc_path,      :limit => 255,  :null => true,  :default => nil
      t.integer  :empl_code,                     :null => true,  :default => nil
      t.integer  :e_sign,                        :null => true,  :default => nil
      t.string   :father_code,   :limit => 160,  :null => true,  :default => nil
      t.integer  :folder_code,                   :null => true,  :default => nil
      t.string   :host_name,     :limit => 18,   :null => true,  :default => nil
      t.integer  :phase_no,                      :null => true,  :default => nil
      t.integer  :pro_code,                      :null => true,  :default => nil
      t.integer  :proc_by,                       :null => true,  :default => nil
      t.integer  :remind,                        :null => true,  :default => nil
      t.string   :sign,          :limit => 18,   :null => true,  :default => nil
      t.integer  :status,                        :null => true,  :default => nil
      t.integer  :tech_code,                     :null => true,  :default => nil
      t.datetime :work_date,                     :null => true,  :default => nil
      t.string   :doc_comment,   :limit => 1000, :null => true,  :default => nil
      t.string   :binder_id,     :limit => 160,  :null => true,  :default => nil
      t.timestamps
    end

    add_index(:doc_hists, :mid, :unique => true, :name => "pk_doc_hist")

    add_index(:doc_hists, :actual,                        :name => "act_doc_hist")
    add_index(:doc_hists, :binder_id,                     :name => "bind_doc_hist")
    add_index(:doc_hists, :busy,                          :name => "bys_doc_hist")
    add_index(:doc_hists, :category_code,                 :name => "cc_doc_hist")
    add_index(:doc_hists, :doc_code,                      :name => "dc_doc_hist")
    add_index(:doc_hists, :e_sign,                        :name => "es_doc_hist")
    add_index(:doc_hists, :father_code,                   :name => "fatherc_doc_hist")
    add_index(:doc_hists, :folder_code,                   :name => "fc_doc_hist")
    add_index(:doc_hists, [:folder_code, :actual],        :name => "ix_doc_hist")
    add_index(:doc_hists, [:folder_code, :pro_code],      :name => "ix_doc_hist_1")
    add_index(:doc_hists, [:folder_code, :doc_code],      :name => "ix_doc_hist_2")
    add_index(:doc_hists, [:folder_code, :phase_no],      :name => "ix_doc_hist_3")
    add_index(:doc_hists, [:folder_code, :category_code], :name => "ix_doc_hist_4")
    add_index(:doc_hists, [:folder_code, :empl_code],     :name => "ix_doc_hist_5")
    add_index(:doc_hists, [:folder_code, :tech_code],     :name => "ix_dochist_1")
    add_index(:doc_hists, :pro_code,                      :name => "pro_doc_hist")
    add_index(:doc_hists, :phase_no,                      :name => "phn_doc_hist")
    add_index(:doc_hists, :status,                        :name => "st_doc_hist")
    add_index(:doc_hists, :tech_code,                     :name => "tc_doc_hist")
  end

end