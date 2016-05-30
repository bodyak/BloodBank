require "migration_helper"
require "csv"

class ImportInGl < ActiveRecord::Migration

  include MigrationHelper

  def self.up
    CSV.foreach(File.join(Rails.root, "doc/Blood/Csv/dbo_Gl.csv"), :encoding => 'CP1251',
                                                                   :headers => :first_row,
                                                                   :col_sep => ';',
                                                                   :quote_char => '"') do |row|
      Gl.create({:code   => row[0],
                 :m_code => row[1],
                 :name   => rewrite_null(row[2])},
                :without_protection => true)
      commit_db_transaction
    end
  end

  def self.down
    Gl.delete_all
  end

end