class AddUserIdToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :user_id, :integer
    add_column :notebooks, :user_id, :integer
  end
end
