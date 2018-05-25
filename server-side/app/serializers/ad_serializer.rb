class AdSerializer < ActiveModel::Serializer
  attributes :id, :title, :type, :description, :published
  has_one :user, serializer: AdUserSerializer
  has_one :item, serializer: AdItemSerializer
  has_one :category, serializer: AdCategorySerializer
  belongs_to :ad_item, serializer: AdAdItemSerializer

end
