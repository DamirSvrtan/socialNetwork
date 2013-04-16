class RemoveNameFromMailingList < ActiveRecord::Migration
  def up
    remove_column :mailing_lists, :name
      end

  def down
    add_column :mailing_lists, :name, :string
  end
end
