class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address

  def index
    @order = OrderAdress.new
  end

end
