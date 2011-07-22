module Ecm
  module Toplists
    class Engine < Rails::Engine
      config.to_prepare do
        ApplicationController.helper(Ecm::ToplistHelper)
      end  
    end
  end  
end
