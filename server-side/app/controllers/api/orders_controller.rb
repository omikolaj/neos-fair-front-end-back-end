class Api::OrdersController < ApplicationController
  include FormatPrice

  def index
    if user = User.find_by(:id=>params[:user_id])
      orders = retrieve_orders_hash(user)
      render json: {orders: orders, status: 200}, status: 200
    else
      render json: {error: "No user found to retrieve the orders", status: 400}, status: 400
    end
  end

  private
  def retrieve_orders_hash(user)
    userOrders = Hash.new
    userOrdersArr = []
    user.orders.each_with_index do |order, index|
      orderItem = {title: order.item.title, condition: order.item.condition}
      userOrders["order_#{index+1}"] = {item: orderItem, price: format(order.item.ad_item.price)}
      userOrdersArr.push(userOrders)
    end
    userOrdersArr
  end

end