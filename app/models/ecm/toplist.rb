module Ecm
  class Toplist < ActiveRecord::Base
#    include RankedModel
#    ranks :list_order  
#    default_scope :order => 'list_order ASC'
    
    validates :name, :presence => true, :uniqueness => true
    validates :link, :format => {:with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, :if => :link }
      
    has_attached_file :preview_image
    # validates_attachment_presence :preview_image
    
    has_attached_file :main_image
    # validates_attachment_presence :main_image  
    
    self.abstract_class = true    
    
    def description_teaser(count = 200)
      return unless description
      if description.length >= count
        shortened = description[0, count]
        splitted = shortened.split(/\s/)
        words = splitted.length
        splitted[0, words-1].join(" ") + ' ...'
      else
        description
      end
    end
  end  
end
