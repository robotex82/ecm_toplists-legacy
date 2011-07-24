class TopClub < Ecm::Toplist
  include RankedModel
  ranks :list_order
  default_scope :order => 'list_order ASC'
end
