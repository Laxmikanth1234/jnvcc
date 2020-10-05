class AddingAdmissionPassoutClass < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :admission_class, :integer
  	add_column :users, :passout_class, :integer
  end
end
