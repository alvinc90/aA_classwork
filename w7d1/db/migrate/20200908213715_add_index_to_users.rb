class AddIndexToUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, [:session_token, :user_name], unique: true
  end
end
