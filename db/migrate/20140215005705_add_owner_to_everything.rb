class AddOwnerToEverything < ActiveRecord::Migration
  def change
  	add_column :documents, :owner_id, :integer
    add_column :notebooks, :owner_id, :integer
    add_column :projects, :owner_id, :integer
  end
end
