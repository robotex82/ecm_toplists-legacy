include ActionDispatch::TestProcess

Factory.define(:admin) do |admin|
  admin.email Forgery(:internet).email_address
  admin.password Forgery(:basic).password
end
