class AddPreviousPlaceInVisit < ActiveRecord::Migration

  def self.up
    add_column :visits, :previous_place, :string
  end

end