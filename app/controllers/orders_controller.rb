class OrdersController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_item, only: [:index, :create]

  def index
    @order = Order.new
  end

  def create
    @order_adress = OrderAdress.new(order_params)
    if @order_adress.valid?
      @order_adress.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  # def set_item
  #   @item = Item.find(params[:id])
  # end

  def order_params
    params.require(:order_adress).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end



end

