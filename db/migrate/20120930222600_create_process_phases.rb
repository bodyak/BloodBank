class CreateProcessPhases < ActiveRecord::Migration

  def change
    create_table(:process_phases) do |t|
      t.integer :doc_code,  :null => false
      t.integer :phase_no,  :null => false
      t.integer :pro_code,  :null => false
      t.integer :work_time, :null => false
      t.timestamps
    end

    add_index(:process_phases, [:doc_code, :phase_no], :unique => true, :name => "pk_process_phase")

    add_index(:process_phases, :pro_code, :name => "ix_process_phase")
  end

end