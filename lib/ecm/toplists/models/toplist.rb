module Ecm
  module Toplists
    module Models
      module Toplist
        validates :name, :presence => true, :uniqueness => true
          
        has_attached_file :preview_image
        validates_attachment_presence :preview_image
        
        has_attached_file :main_image
        validates_attachment_presence :main_image       
      end
    end
  end
end      
