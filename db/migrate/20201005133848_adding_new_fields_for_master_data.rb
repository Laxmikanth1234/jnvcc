class AddingNewFieldsForMasterData < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :country_code, :string
  	add_column :users, :native_place, :string
  	add_column :users, :native_mandal, :string
  	add_column :users, :native_pin, :string
  	add_column :users, :admission_year, :string
  	add_column :users, :passout_year, :string
  	add_column :users, :current_state, :string
  	add_column :users, :current_country, :string
  	add_column :users, :working_sector, :string
  end
end