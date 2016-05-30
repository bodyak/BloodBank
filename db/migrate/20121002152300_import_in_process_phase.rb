require "csv"

class ImportInProcessPhase < ActiveRecord::Migration

  def self.up
    CSV.foreach(File.join(Rails.root, "doc/Blood/Csv/dbo_Process_Phase.csv"), :encoding => 'CP1251',
                                                                              :headers => :first_row,
                                                                              :col_sep => ';',
                                                                              :quote_char => '"') do |row|
      ProcessPhase.create({:doc_code  => row[0],
                           :phase_no  => row[1],
                           :pro_code  => row[2],
                           :work_time => row[3]},
                          :without_protection => true)
      commit_db_transaction
    end
  end

  def self.down
    ProcessPhase.delete_all
  end

end