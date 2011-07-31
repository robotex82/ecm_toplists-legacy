module Ecm
  module Toplists
    module Generators
      class CreateGenerator < Rails::Generators::NamedBase
        desc "Generates a toplist with the given CamelCasedName"
        
        argument :name, :type => :string        

        def generate_migration
          generate "ecm:toplists:migration", name
        end

        def generate_model
          generate "ecm:toplists:model", name
        end
        
        def generate_controller
          generate "ecm:toplists:controller", name
        end     
        
        def generate_admin_controller
          generate "ecm:toplists:admin_controller", name
        end
      end
    end
  end
end

