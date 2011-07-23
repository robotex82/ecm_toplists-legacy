include ActionDispatch::TestProcess

Factory.define(:top_club) do |top_club|
  top_club.name Forgery(:name).location
  top_club.description Forgery(:lorem_ipsum).paragraphs(3)
  top_club.link "www.#{Forgery(:internet).domain_name}"  
  top_club.preview_image  { fixture_file_upload "assets/top_club/preview_image.jpg", 'image/jpeg' }
  top_club.main_image { fixture_file_upload "assets/top_club/main_image.jpg", 'image/jpeg' } 
end
