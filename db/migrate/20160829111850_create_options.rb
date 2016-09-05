class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :site_header
      t.string :site_sub_header
      t.string :user_name
      t.string :password
      t.string :email

      t.timestamps null: false
    end
  end
end
