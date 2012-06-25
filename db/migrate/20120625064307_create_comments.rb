class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :my_posts

      t.timestamps
    end
    add_index :comments, :my_post_id
  end
end
