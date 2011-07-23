require 'factory_girl' 
Dir["#{File.dirname(__FILE__)}/../factories/**/*.rb"].each { |f| require f }

class ActiveSupport::TestCase
  self.use_transactional_fixtures = true
end

