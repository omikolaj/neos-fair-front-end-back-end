class Item < ApplicationRecord    
    belongs_to :ad_item
    has_one :ad, :through => :ad_item
    has_one :user, :through => :ad
end
