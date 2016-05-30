require "migration_helper"
require "csv"

class ImportInAction < ActiveRecord::Migration

  include MigrationHelper

  def self.up
    CSV.foreach(File.join(Rails.root, "doc/Blood/Csv/dbo_Process.csv"), :encoding => 'CP1251',
                                                                        :headers => :first_row,
                                                                        :col_sep => ';',
                                                                        :quote_char => '"') do |row|
      Action.create({:pro_code      => row[0],
                     :pro_use_rcode => row[1],
                     :tech_code     => row[2],
                     :pro_com       => rewrite_null(row[3]),
                     :pro_name      => rewrite_null(row[4]),
                     :pro_time      => row[5]},
                    :without_protection => true)
      commit_db_transaction
    end
  end

  def self.down
    Action.delete_all
  end

end