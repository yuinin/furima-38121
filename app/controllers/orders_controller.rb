class OrdersController < ApplicationController
  before_action :set_item, only: [:create]

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def order_params
    params.require(:order).merge(user_id: current_user.id, item_id: @item.id)
  end

end
end
