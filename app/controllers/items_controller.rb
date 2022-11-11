class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_login, except: [:index, :show]
  before_action :move_to_index, only: [:edit]

  def index
    @item = Item.all.order(updated_at: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item.user_id)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_index
    @item = Item.find(params[:id])
    if user_signed_in?
      unless @item.user_id == current_user.id
        redirect_to action: :index
      end
    end
  end


  def item_params
    params.require(:item).permit(:image, :product_name, :explanation, :category_id, :condition_id, :shipping_cost_id, :from_id,
                                 :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end
end
