class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :token, :username
  has_many :ads, serializer: UserAdsSerializer  
end
