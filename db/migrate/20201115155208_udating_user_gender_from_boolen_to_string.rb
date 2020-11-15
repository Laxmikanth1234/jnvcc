class UdatingUserGenderFromBoolenToString < ActiveRecord::Migration[5.0]
  def change
     execute "UPDATE users SET gender = 'male' WHERE gender = 'false'"
     execute "UPDATE users SET gender = 'female' WHERE gender = 'true'"
  end
end
