class AdSerializer < ActiveModel::Serializer
  attributes :id, :title 
  belongs_to :user, serializer: AdUserSerializer

end
