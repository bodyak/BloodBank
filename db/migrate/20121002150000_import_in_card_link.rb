require "csv"

class ImportInCardLink < ActiveRecord::Migration

  def self.up
    CSV.foreach(File.join(Rails.root, "doc/Blood/Csv/dbo_CardLink.csv"), :encoding   => 'CP1251',
                                                                         :headers    => true,
                                                                         :col_sep    => ';',
                                                                         :quote_char => '"') do |row|
      CardLink.create({:ckey      => row[0],
                       :fnum      => row[1],
                       :cdoc      => row[2],
                       :curr_cdoc => row[3]},
                      :without_protection => true)
      commit_db_transaction
    end
  end

  def self.down
    CardLink.delete_all
  end

end