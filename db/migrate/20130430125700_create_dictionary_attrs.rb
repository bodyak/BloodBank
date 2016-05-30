class CreateDictionaryAttrs < ActiveRecord::Migration
  def change
    create_table(:dictionary_attrs) do |t|
      t.references :dictionary
      t.text       :dyn_attrs
      t.timestamps
    end
  end

end