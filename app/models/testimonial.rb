class Testimonial < ApplicationRecord
	belongs_to :user
	validates :testimonial, presence: true
end
