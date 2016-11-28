class AddUserIndexToTestimonials < ActiveRecord::Migration[5.0]
  def change
  	add_index :testimonials, :user_id
  end
end
