require "migration_helper"
require "csv"

class ImportInCardVal < ActiveRecord::Migration

  include MigrationHelper

  def self.up
    CSV.foreach(File.join(Rails.root, "doc/Blood/Csv/dbo_Cardval.csv"), :encoding   => 'CP1251',
                                                                        :headers    => true,
                                                                        :col_sep    => ';',
                                                                        :quote_char => '"') do |row|
      CardVal.create({:cdoc      => row[0],
                      :ckey      => row[1],
                      :fnum      => row[2],
                      :fval      => rewrite_null(row[3]),
                      :fval_long => rewrite_null(row[4]),
                      :fval_num  => row[5]},
                     :without_protection => true)
      commit_db_transaction
    end
  end

  def self.down
    CardVal.delete_all
  end

end