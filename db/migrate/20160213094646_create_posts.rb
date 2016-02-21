class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :post_title
      t.text :post_text
      t.string :post_image
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
