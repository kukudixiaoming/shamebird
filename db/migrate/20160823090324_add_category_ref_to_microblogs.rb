class AddCategoryRefToMicroblogs < ActiveRecord::Migration
  def change
    add_reference :microblogs, :category, index: true, foreign_key: true
  end
end
