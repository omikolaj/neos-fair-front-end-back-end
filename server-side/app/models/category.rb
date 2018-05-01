class Category < ApplicationRecord
    belongs_to :ad_item
    has_many :ads, :through => :ad_item
end
