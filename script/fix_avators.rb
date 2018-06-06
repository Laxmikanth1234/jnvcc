users = User.all

users.each do |user|
  
  user.avatar_file_name = nil
  user.avatar_content_type = nil
  user.avatar_file_size = nil
  user.avatar_updated_at = nil
  puts user.name + " fixed"
  user.save!
end
