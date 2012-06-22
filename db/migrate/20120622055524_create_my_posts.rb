class CreateMyPosts < ActiveRecord::Migration
  def change
    create_table :my_posts do |t|
      t.string :name
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
