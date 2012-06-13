class RemoveAuthTokenToUser < ActiveRecord::Migration
  def up
    remove_column :users, :auth_token
      end

  def down
    add_column :users, :auth_token, :integer
  end
end
