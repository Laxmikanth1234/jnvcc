class Event < ApplicationRecord
  belongs_to :user
   validates :name, :story, :when, :where, presence: true
   has_attached_file :avatar, :styles => { :medium => "600x600>", :thumb => "300x300#" }, :default_url => "/images/:style/missing.png"
   validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
