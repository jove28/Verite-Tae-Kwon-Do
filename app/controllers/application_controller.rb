class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order, :quantity_of_items_in_cart

  def current_order
    if !session[:order_id].nil?
      Order.find_by(id: session[:order_id])
    else
      Order.new
    end
  end

  def  quantity_of_items_in_cart


    @order = current_order.order_items

    unless @order.nil?

      total = 0

      @order.each do |item|
        total += item.quantity_of_product
      end

      total
    end
  end
end
