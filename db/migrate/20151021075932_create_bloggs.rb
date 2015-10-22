class CreateBloggs < ActiveRecord::Migration
  def change
    create_table :bloggs do |t|
      t.string :name
      t.text :content
      t.string :blog_type
      t.integer :user_id
      t.timestamps
    end
  end
end
