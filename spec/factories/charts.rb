include ActionDispatch::TestProcess

Factory.define(:charts) do |charts|
  charts.name Forgery(:name).location
  charts.description Forgery(:lorem_ipsum).paragraphs(3)
  charts.link "http://www.#{Forgery(:internet).domain_name}"  
  charts.preview_image  { fixture_file_upload "assets/charts/preview_image.jpg", 'image/jpeg' }
  charts.main_image { fixture_file_upload "assets/charts/main_image.jpg", 'image/jpeg' } 
end
