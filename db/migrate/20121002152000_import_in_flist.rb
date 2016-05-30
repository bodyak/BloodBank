require "migration_helper"
require "csv"

class ImportInFlist < ActiveRecord::Migration

  include MigrationHelper

  def self.up
    CSV.foreach(File.join(Rails.root, "doc/Blood/Csv/dbo_Flist.csv"), :encoding => 'CP1251',
                                                                      :headers => :first_row,
                                                                      :col_sep => ';',
                                                                      :quote_char => '"') do |row|
      Flist.create({:ckey          => row[0],
                    :fnum          => row[1],
                    :fcapt         => rewrite_null(row[2]),
                    :fcsource      => rewrite_null(row[3]),
                    :fcwidth       => row[4],
                    :fformat       => rewrite_null(row[5]),
                    :field_key     => rewrite_null(row[6]),
                    :field_process => row[7],
                    :fleft         => row[8],
                    :fread         => row[9],
                    :ftab          => row[10],
                    :fthight       => row[11],
                    :ftop          => row[12],
                    :ftwidth       => row[13],
                    :ftype         => row[14],
                    :fwrite        => row[15],
                    :table_index   => row[16],
                    :sub_index     => row[17],
                    :font_style    => rewrite_null(row[18]),
                    :fattrib       => rewrite_null(row[19]),
                    :fcaptvisible  => row[20]},
                   :without_protection => true)
      commit_db_transaction
    end
  end

  def self.down
    Flist.delete_all
  end

end