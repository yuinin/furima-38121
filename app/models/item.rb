class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :product_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :from_id, presence: true
  validates :send_id, presence: true
  validates :price, presence: true, numericality: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :user_id, presence: true, foreign_key: true
end
