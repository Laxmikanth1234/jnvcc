class RemoveIsActiveUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :is_active?
  	add_column :users, :is_active, :boolean 
  end
end
