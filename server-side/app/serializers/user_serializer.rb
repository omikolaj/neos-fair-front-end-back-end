class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :token, :username
  has_many :ads, serializer: UserAdsSerializer
  
end
