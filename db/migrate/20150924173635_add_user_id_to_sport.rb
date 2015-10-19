class AddUserIdToSport < ActiveRecord::Migration
  def up
    add_column :sports, :user_id, :integer
  end

  def down
    remove_column :sports, :user_id, :integer
  end
end
