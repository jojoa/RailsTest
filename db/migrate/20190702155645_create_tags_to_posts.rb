class CreateTagsToPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :tags_to_posts do |t|
      t.integer :post_id
      t.integer :tag_id
      
      t.timestamps
    end
  end
end
