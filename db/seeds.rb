# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

laxmikanth = User.create!(email: "laxmikanth.veggalam@gmail.com", name: "LaxmiKanth", password: "test123", date_of_birth: "14/04/1987",gender: false, batch: 12, education_qualification: "MCA", current_location: "Hyderabad",profession: "Software Engineer" ,industry: "TechvoxInc" ,admin: true, is_active: true)
