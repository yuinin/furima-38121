class Item < ApplicationRecord
  belongs_to :user
  validates :product_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :from_id, presence: true
  validates :send_id, presence: true
  validates :price, presence: true
  validates :user_id, presence: true, foreign_key: true
end
