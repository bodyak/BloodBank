class ChangeNameInRole < ActiveRecord::Migration

  def self.up
    change_column(:roles, :name, :string, {:limit => 30, :null => false})
  end

end