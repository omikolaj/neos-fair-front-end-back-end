class AdSerializer < ActiveModel::Serializer
  attributes :id, :title, :type, :description, :published
  belongs_to :user, serializer: AdUserSerializer

end
