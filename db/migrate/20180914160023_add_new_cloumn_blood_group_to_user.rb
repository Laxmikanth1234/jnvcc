class AddNewCloumnBloodGroupToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :bloodgroup, :string
  end
end
