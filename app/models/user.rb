# == Schema Information
#
# Table name: accounts
#
#  id                              :uuid             not null, primary key
#  name                 		   :string(255)      not null
#  email						   :string(255)
#  date_of_birth				   :date
#  batch  						   :int
#  admin						   :boolean
#  current_location				   :string(255)
#  education_qualification		   :string(255)
#  profession					   :string(255)
#  mobile						   :string(255)
#  address, 					   :text
#  aboutme,						   :text
#  gender, 						   :string
#  active                          :boolean          default(FALSE) need to add
#  industry                        :string(255) 
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # attr_accessor :name, :date_of_birth, :gender, :batch
  has_many :activities
  has_many :events


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :name, :date_of_birth, :gender, :batch, :education_qualification,:current_location,:profession,:industry, presence: true
  validates :email, uniqueness: true

  BATCH = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24 , 25, 26, 27,]
  
  PROFESSION = ["Student", "SoftWare Engineer", "Docter", "Police", "Teacher", "Lower", "need to add more here"]

   def self.search(search)
   	if search
   		where("name ILIKE ? OR email ILIKE ? OR current_location ILIKE ? OR education_qualification ILIKE ? OR industry ILIKE ? OR mobile ILIKE ?" , "%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%")
   	else
   		all
   	end
   end

   def active_for_authentication?
        # Uncomment the below debug statement to view the properties of the returned self model values.
        # logger.debug self.to_yaml
        super && is_active
   end



end
