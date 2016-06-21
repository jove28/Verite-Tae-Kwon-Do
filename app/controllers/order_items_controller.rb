class OrderItemsController < ApplicationController
  def create
    @order = current_order

    @order_item = @order.order_items.find_by(product_id: params[:order_item][:product_id])

    if @order_item.nil?
      @order_item = @order.order_items.new(order_item_params)
      @order.save
    else
      @order_item.update_attributes!(quantity: params[:order_item][:quantity].to_i + @order_item.quantity_of_product)
    end

    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find_by(id: params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find_by(id: params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end