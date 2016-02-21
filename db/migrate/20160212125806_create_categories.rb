class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category_name
      t.string :category_brief
      t.string :category_image

      t.timestamps null: false
    end
  end
end
