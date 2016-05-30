class AddBirthDateToSkins < ActiveRecord::Migration

  def change
    add_column :skins, :birth_date, :date
  end

end