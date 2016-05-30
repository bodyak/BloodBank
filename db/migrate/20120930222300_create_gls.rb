class CreateGls < ActiveRecord::Migration

  def change
    create_table(:gls) do |t|
      t.integer :code,                  :null => false
      t.integer :m_code,                :null => true,  :default => nil
      t.string  :name,   :limit => 255, :null => true,  :default => nil
      t.timestamps
    end

    add_index(:gls, :code, :unique => true, :name => "pk_gl")

    add_index(:gls, :m_code, :name => "ix_gl")
  end

end