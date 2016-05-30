class UpdateColumnsInDonorDocument < ActiveRecord::Migration
  def change
    DonorDocument.where("doc_id is null").update_all("doc_id = 0")
    DonorDocument.where("serial_doc is null").update_all("serial_doc = '#{I18n.t("donor_documents.no_serial_doc")}'")
    DonorDocument.where("number_doc is null").update_all("number_doc = '#{I18n.t("donor_documents.no_number_doc")}'")
  end
end