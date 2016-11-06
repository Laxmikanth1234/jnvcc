class Activity < ApplicationRecord
	belongs_to :user
	has_many :comments
	validates :post, presence: true
end
