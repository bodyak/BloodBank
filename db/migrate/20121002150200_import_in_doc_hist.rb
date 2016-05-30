require "migration_helper"
require "csv"

class ImportInDocHist < ActiveRecord::Migration

  include MigrationHelper

  def self.up
    CSV.foreach(File.join(Rails.root, "doc/Blood/Csv/dbo_Doc_Hist.csv"), :encoding   => 'CP1251',
                                                                         :headers    => true,
                                                                         :col_sep    => ';',
                                                                         :quote_char => '"') do |row|
      DocHist.create({:mid           => rewrite_null(row[0]),
                      :act_path      => rewrite_null(row[1]),
                      :actual        => row[2],
                      :busy          => row[3],
                      :category_code => row[4],
                      :complete_date => row[5],
                      :crypt         => row[6],
                      :doc_code      => row[7],
                      :doc_path      => rewrite_null(row[8]),
                      :empl_code     => row[9],
                      :e_sign        => row[10],
                      :father_code   => rewrite_null(row[11]),
                      :folder_code   => row[12],
                      :host_name     => rewrite_null(row[13]),
                      :phase_no      => row[14],
                      :pro_code      => row[15],
                      :proc_by       => row[16],
                      :remind        => row[17],
                      :sign          => rewrite_null(row[18]),
                      :status        => row[19],
                      :tech_code     => row[20],
                      :work_date     => row[21],
                      :doc_comment   => rewrite_null(row[22]),
                      :binder_id     => rewrite_null(row[23])},
                     :without_protection => true)
      commit_db_transaction
    end
  end

  def self.down
    DocHist.delete_all
  end

end