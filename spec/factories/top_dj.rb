include ActionDispatch::TestProcess

Factory.define(:top_dj) do |top_dj|
  top_dj.name "Example entry"
  top_dj.description "This is the description"
  top_dj.link "www.example.com"  
  top_dj.preview_image  { fixture_file_upload "assets/top_dj/preview_image.jpg", 'image/jpeg' }
  top_dj.main_image     { fixture_file_upload "assets/top_dj/main_image.jpg", 'image/jpeg' } 
end
