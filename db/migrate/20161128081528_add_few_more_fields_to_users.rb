class AddFewMoreFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :sirname, :string
    add_column :users, :designation, :string
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
    add_column :users, :linkedin, :string
    add_column :users, :rep?, :boolean, default: false
  end
end
