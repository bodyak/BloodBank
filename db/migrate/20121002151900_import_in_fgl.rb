require "migration_helper"
require "csv"

class ImportInFgl < ActiveRecord::Migration

  include MigrationHelper

  def self.up
    CSV.foreach(File.join(Rails.root, "doc/Blood/Csv/dbo_Fgl.csv"), :encoding => 'CP1251',
                                                                    :headers => :first_row,
                                                                    :col_sep => ';',
                                                                    :quote_char => '"') do |row|
      Fgl.create({:code          => row[0],
                  :f_value_code  => row[1],
                  :glossary_code => row[2],
                  :name          => rewrite_null(row[3]),
                  :date_begin    => row[4],
                  :date_end      => row[5]},
                 :without_protection => true)
      commit_db_transaction
    end
  end

  def self.down
    Fgl.delete_all
  end

end