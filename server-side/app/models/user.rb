class User < ApplicationRecord
    has_many :drafts, class_name: 'Draft' 
    has_many :ad_items 
    has_many :ads, :through => :ad_items
    has_many :items, :through => :ads
    has_many :orders 
end
