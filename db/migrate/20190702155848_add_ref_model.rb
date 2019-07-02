class AddRefModel < ActiveRecord::Migration[5.2]
  def change
    add_index :tags_to_post, :post_id,
    add_index :tags_to_post, :tag_id
    add_index :tags_to_post, [:post_id, :tag_id], unique: true
    add_reference :tags_to_posts, :tags, foreign_key:true
  end
end
