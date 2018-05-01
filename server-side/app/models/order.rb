class Order < ApplicationRecord
    belongs_to :user
    belongs_to :ad_item
    has_one :ad, :through => :ad_item
    has_one :item, :through => :ad_item
    
end
