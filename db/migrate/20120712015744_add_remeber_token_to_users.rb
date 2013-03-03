class AddRemeberTokenToUsers < ActiveRecord::Migration
  def change
	add_column :users, :remeber_token, :string
	add_index  :users, :remeber_token
  end
end
