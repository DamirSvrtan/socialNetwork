class RemoveTagsColumnFromPhotos < ActiveRecord::Migration
  def change
      remove_column :photos, :tags
  end
end
