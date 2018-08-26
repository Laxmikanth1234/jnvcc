class ChangeUsersSirnameCoumns < ActiveRecord::Migration[5.0]
  def change
  	rename_column :users, :sirname, :surname
  end
end
