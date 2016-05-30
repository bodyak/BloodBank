class CreateDictionaries < ActiveRecord::Migration
  def change
    create_table(:dictionaries) do |t|
      t.references :glossary
      t.string     :value_name
      t.string     :position   # Порядковий номер в довіднику
      t.string     :type
      t.string     :ancestry
      t.timestamps
    end

    add_index(:dictionaries, :ancestry)
  end
end