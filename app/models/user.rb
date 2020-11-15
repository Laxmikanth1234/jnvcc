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
  #  bloodgroup            :string
  #  active                          :boolean          default(true) need to add
  #  industry                        :string(255) 
  #  :surname, :designation, :facebook, :twitter, :linkedin, :rep?, 
  #  created_at                      :datetime         not null
#  updated_at                      :datetime         not null

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # attr_accessor :name, :date_of_birth, :gender, :batch
  has_many :activities
  has_many :events
  has_many :testimonials


  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader
  # has_attached_file :avatar, :styles => { :medium => "600x600>", :thumb => "300x300#" }, :default_url => "/images/:style/missing.png"
  # validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :name, :surname, :date_of_birth, :gender, :batch, :education_qualification, :profession,:industry, presence: true
  validates :email, uniqueness: true 

  BATCH = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24 , 25, 26, 27,]
  BLOODGROP = ['A+', 'A-', 'AB+', 'AB-', 'B+', 'B-', 'O+', 'O-']
  WORKING_SECTOR = ['Government', 'Private', 'Business', 'Self Employed', 'Student', 'Others']
  
  # PROFESSION = ["Student", "SoftWare Engineer", "Docter", "Police", "Teacher", "Lower", "need to add more here"]

   def self.search(search)
   	if search
   		where("name ILIKE ? OR email ILIKE ? OR current_location ILIKE ? OR education_qualification ILIKE ? OR industry ILIKE ? OR mobile ILIKE ? OR profession ILIKE ? OR bloodgroup ILIKE ?" , "%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%")
   	else
   		all
   	end
   end

   def active_for_authentication?
        # Uncomment the below debug statement to view the properties of the returned self model values.
        # logger.debug self.to_yaml
        super && is_active
   end


   def is_active?
      is_active
   end

   self.per_page = 20
  # def self.import(file)
  #   spreadsheet = open_spreadsheet(file)
  #   header = spreadsheet.row(1)
  #   (2..spreadsheet.last_row).each do |i|
  #   row = Hash[[header, spreadsheet.row(i)].transpose]
  #   user = find_by_id(row["email"]) || new
  #   user.attributes = row.to_hash.slice(*accessible_attributes)
  #   user.save!
  # end
  # end

  # def self.open_spreadsheet(file)
  #   case File.extname(file.original_filename)
  #   when ".csv" then Csv.new(file.path, nil, :ignore)
  #   when ".xls" then Excel.new(file.path, nil, :ignore)
  #   when ".xlsx" then Excelx.new(file.path, nil, :ignore)
  #   else raise "Unknown file type: #{file.original_filename}"
  #   end 
  # end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
    # User.create! row.to_hash 
    user = find_by(email: row["email"]) || new
    user.update row.to_hash
    user.save!
    end
  end

end
