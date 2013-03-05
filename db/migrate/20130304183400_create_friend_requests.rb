class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
      t.integer :requester_id
      t.integer :requestee_id

      t.timestamps
    end
  end
end
