class RemoveUserIndexToTestimonials < ActiveRecord::Migration[5.0]
  def change
  	remove_index :testimonials, :user_id
  end
end
