include ActionDispatch::TestProcess

Factory.define(:top_club) do |top_club|
  top_club.name "Example entry"
  top_club.description "This is the description"
  top_club.link "www.example.com"  
  top_club.preview_image  { fixture_file_upload "assets/top_club/preview_image.jpg", 'image/jpeg' }
  top_club.main_image { fixture_file_upload "assets/top_club/main_image.jpg", 'image/jpeg' } 
end
