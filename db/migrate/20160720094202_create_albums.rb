class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.text :description
      t.string :picture

      t.timestamps null: false
    end
  end
end
