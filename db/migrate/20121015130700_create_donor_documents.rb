class CreateDonorDocuments < ActiveRecord::Migration
  def change
    create_table(:donor_documents) do |t|
      t.references :donor
      t.string     :doc_id       # fnum_32  fnum_40  Тип документа
      t.string     :serial_doc   # fnum_9   fnum_50  Серія документа
      t.string     :number_doc   # fnum_10  fnum_51  Номер документа
      t.date       :date_doc     # fnum_71  fnum_72  Дата видачі документа
      t.string     :org_doc      # fnum_74  fnum_75  Орган який видав документ
      t.timestamps
    end
  end
end