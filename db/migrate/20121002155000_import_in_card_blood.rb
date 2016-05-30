require "migration_helper"
require "csv"

class ImportInCardBlood < ActiveRecord::Migration

  include MigrationHelper

  def self.up
    CSV.foreach(File.join(Rails.root, "doc/Blood/Csv/dbo_RC_2_62.csv"), :encoding => 'CP1251',
                                                                        :headers => :first_row,
                                                                        :col_sep => ';',
                                                                        :quote_char => '"') do |row|
      CardBlood.create({:cdoc   => row[0],
                        :ckey   => row[1],
                        :pole_1 => rewrite_null(row[2]),
                        :pole_2 => rewrite_null(row[3]),
                        :pole_3 => rewrite_null(row[4]),
                        :pole_4 => rewrite_null(row[5]),
                        :pole_5 => rewrite_null(row[6]),
                        :pole_6 => rewrite_null(row[7]),
                        :pole_7 => rewrite_null(row[8])},
                       :without_protection => true)
      commit_db_transaction
    end
  end

  def self.down
    CardBlood.delete_all
  end

end