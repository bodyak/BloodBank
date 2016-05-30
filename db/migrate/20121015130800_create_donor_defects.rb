class CreateDonorDefects < ActiveRecord::Migration
  def change
    create_table(:donor_defects) do |t|
      t.references :donor
      t.string     :defect_org_id    # fnum_26  Організація яка забракувала
      t.date       :defect_date      # fnum_27  Дата відбраковки
      t.date       :defect_end       #          Термін дії заборони
      t.string     :defect_cause_id  # fnum_25  Причина відбраковки
      t.timestamps
    end
  end
end