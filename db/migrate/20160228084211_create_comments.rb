class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment_text
      t.string :comment_author
      t.string :comment_email
      t.string :comment_site
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
