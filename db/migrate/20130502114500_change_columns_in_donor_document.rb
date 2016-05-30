class ChangeColumnsInDonorDocument < ActiveRecord::Migration
  def self.up
    change_column(:donor_documents, :donor_id, :integer, {:null => false})
    change_column(:donor_documents, :doc_id, :integer, {:null => false})
    change_column(:donor_documents, :serial_doc, :string, {:limit => 30, :null => false})
    change_column(:donor_documents, :number_doc, :string, {:limit => 30, :null => false})
    change_column(:donor_documents, :org_doc, :string, {:limit => 100})
  end
end