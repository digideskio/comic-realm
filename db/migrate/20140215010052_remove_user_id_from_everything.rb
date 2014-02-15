class RemoveUserIdFromEverything < ActiveRecord::Migration
  def change
  	remove_column :documents, :user_id, :integer
    remove_column :notebooks, :user_id, :integer
    remove_column :projects, :user_id, :integer
  end
end
