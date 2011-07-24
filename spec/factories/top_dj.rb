include ActionDispatch::TestProcess

Factory.define(:top_dj) do |top_dj|
  top_dj.name Forgery(:name).full_name
  top_dj.description Forgery(:lorem_ipsum).paragraphs(3)
  top_dj.link "http://www.#{Forgery(:internet).domain_name}"  
  top_dj.preview_image  { fixture_file_upload "assets/top_dj/preview_image.jpg", 'image/jpeg' }
  top_dj.main_image     { fixture_file_upload "assets/top_dj/main_image.jpg", 'image/jpeg' } 
end
