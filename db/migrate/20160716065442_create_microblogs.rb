class CreateMicroblogs < ActiveRecord::Migration
  def change
    create_table :microblogs do |t|
      t.text :text
      t.string :photo
      t.string :music

      t.timestamps null: false
    end
  end
end
