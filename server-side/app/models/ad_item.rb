class AdItem < ApplicationRecord
    belongs_to :user
    has_one :ad
    has_one :order
    has_one :item
    has_one :category
    validates :price, presence: true
end
