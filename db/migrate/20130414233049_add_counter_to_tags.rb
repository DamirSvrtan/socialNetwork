class AddCounterToTags < ActiveRecord::Migration
  def change
	add_column :tags, :counter, :integer, :default => 0
  end
end
