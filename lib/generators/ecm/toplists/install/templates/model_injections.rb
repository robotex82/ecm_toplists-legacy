  include RankedModel  :list_order
  default_scope :order => 'list_order ASC'
  
  def list_position
    self.class.where("list_order < ?", list_order).count
  end
  
  rails_admin do
    list do
      field :id
      field :reorder do
        formatted_value do
          output = []
          o = bindings[:object]
          v = bindings[:view]
          output << v.link_to("First", v.list_order_position_admin_top_club_path(o, :first),             :method => :put)
          output << v.link_to("Up",    v.list_order_position_admin_top_club_path(o, o.list_position-1), :method => :put)
          output << v.link_to("Down",  v.list_order_position_admin_top_club_path(o, o.list_position+1), :method => :put)
          output << v.link_to("Last",  v.list_order_position_admin_top_club_path(o, :last),              :method => :put)
          v.raw output.join("&nbsp;")
        end
      end
      field :list_order
      field :name
      field :description      
      field :link
      field :preview_image      
      field :main_image
      field :updated_at
      field :created_at
    end
  end  
