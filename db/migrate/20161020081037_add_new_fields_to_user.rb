class AddNewFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :current_location, :string
    add_column :users, :education_qualification, :string
    add_column :users, :profession, :string
    add_column :users, :industry, :string
    add_column :users, :mobile, :string
    add_column :users, :address, :text
    add_column :users, :aboutme, :text
    remove_column :users, :gender
    add_column :users, :gender, :string
  end
end
