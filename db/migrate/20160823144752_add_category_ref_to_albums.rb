class AddCategoryRefToAlbums < ActiveRecord::Migration
  def change
    add_reference :albums, :category, index: true, foreign_key: true
  end
end
