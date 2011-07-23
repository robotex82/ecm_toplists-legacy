module Ecm
  class Toplist < ActiveRecord::Base
    include RankedModel
    ranks :list_order  
    
    validates :name, :presence => true, :uniqueness => true
      
    has_attached_file :preview_image
    validates_attachment_presence :preview_image
    
    has_attached_file :main_image
    validates_attachment_presence :main_image  
    
    self.abstract_class = true    
  end  
end
