require 'will_paginate'
module Ecm
  module Toplists
    class Engine < Rails::Engine
      config.to_prepare do
        ApplicationController.helper(Ecm::ToplistHelper)
      end  
    end
    
    def self.config(&block)
      @@config ||= Engine.config
      yield @@config if block
      return @@config
    end
  end  
end
