class UserAdsSerializer < ActiveModel::Serializer
  attributes :id, :title,
  # has_one :item, serializer: UserAdItemSerializer
  # has_one :category, serializer:UserAdCategorySerializer  
end
