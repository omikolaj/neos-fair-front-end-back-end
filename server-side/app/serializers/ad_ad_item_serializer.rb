class AdAdItemSerializer < ActiveModel::Serializer
  include FormatPrice
  attributes :price

  def price
    format(self.object.price)
  end
end