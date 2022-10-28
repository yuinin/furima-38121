class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(:image, :product_name, :explanation, :category_id, :condition_id, :shipping_cost_id, :from_id, :send_id, :price).merge(user_id: current_user.id)
  end
end
