class OrderAdress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token


  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture, numericality: {other_than: 1, message: "can't be blank"}
  validates :city, presence: true
  validates :house_number, presence: true
  validates :phone_number, presence: true, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid."}
  validates :user_id, presence: true
  validates :item_id, presence: true

  def save
  order = Order.create(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  # redirect_to "/tweets/#{comment.tweet.id}"  # コメントと結びつくツイートの詳細画面に遷移する
end

end