class CreateGlossaries < ActiveRecord::Migration
  def change
    create_table(:glossaries) do |t|
      t.string     :name
      t.string     :name_type
      t.string     :format_value
      t.string     :ancestry
      t.timestamps
    end

    add_index(:glossaries, :ancestry)
  end
end