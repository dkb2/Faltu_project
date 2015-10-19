class AddBlogTypeToSport < ActiveRecord::Migration
  def change
    add_column :sports, :blog_type, :string
  end
end
