require "migration_helper"
require "csv"

class ImportInDocument < ActiveRecord::Migration

  include MigrationHelper

  def self.up
    CSV.foreach(File.join(Rails.root, "doc/Blood/Csv/dbo_Document.csv"), :encoding   => 'CP1251',
                                                                         :headers    => true,
                                                                         :col_sep    => ';',
                                                                         :quote_char => '"') do |row|
      Document.create({:doc_code      => row[0],
                       :card          => row[1],
                       :card_code     => row[2],
                       :card_set_id   => rewrite_null(row[3]),
                       :category_code => row[4],
                       :ch_name_code  => row[5],
                       :ch_name_date  => row[6],
                       :doc_com       => rewrite_null(row[7]),
                       :doc_date      => row[8],
                       :doc_name      => rewrite_null(row[9]),
                       :doc_no        => rewrite_null(row[10]),
                       :doc_type      => rewrite_null(row[11]),
                       :empl_code     => row[12],
                       :folder_code   => row[13]},
                      :without_protection => true)
      commit_db_transaction
    end
  end

  def self.down
    Document.delete_all
  end

end