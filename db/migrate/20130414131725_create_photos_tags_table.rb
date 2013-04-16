class CreatePhotosTagsTable < ActiveRecord::Migration
  def change
      create_table :photos_tags, :id => false do |t|
             t.references :photo
             t.references :tag
      end
  end
end
