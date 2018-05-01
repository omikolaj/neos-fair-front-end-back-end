class Ad < ApplicationRecord
    scope :drafts, -> { where(type: 'Draft')} # Ad.drafts
    belongs_to :ad_item
    has_one :user, :through => :ad_item # Ad.user
    has_one :item, :through => :ad_item # Ad.item
    has_one :category, :through => :ad_item
    
    
end
