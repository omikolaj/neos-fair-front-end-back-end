class Category < ApplicationRecord
    belongs_to :ad_item
    has_many :ads, :through => :ad_item

    def category_attributes=(category_attributes)
        binding.pry
    end
end
