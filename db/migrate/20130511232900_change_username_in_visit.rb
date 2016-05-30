class ChangeUsernameInVisit < ActiveRecord::Migration

  def self.up
    change_column(:users, :username, :string, {:limit => 30, :null => false})
  end

end