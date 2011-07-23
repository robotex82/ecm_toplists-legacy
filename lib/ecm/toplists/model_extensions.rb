module Ecm
  module Toplists
    module ModelExtensions
      include RankedModel
      ranks :list_order  
      default_scope :order => 'list_order ASC'
      
      validates :name, :presence => true, :uniqueness => true
        
      has_attached_file :preview_image
      validates_attachment_presence :preview_image
      
      has_attached_file :main_image
      validates_attachment_presence :main_image        
    end
  end
end      
