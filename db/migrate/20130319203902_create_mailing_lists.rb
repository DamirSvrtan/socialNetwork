class CreateMailingLists < ActiveRecord::Migration
  def change
    create_table :mailing_lists do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
