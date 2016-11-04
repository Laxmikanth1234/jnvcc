class AddUserNameAndOtherFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :gender, :boolean
    add_column :users, :batch, :int
    remove_column :users, :gender
    add_column :users, :gender, :string
  end
end
