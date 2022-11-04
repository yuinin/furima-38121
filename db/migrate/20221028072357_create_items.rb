class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :product_name, null: false
      t.text    :explanation, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_cost_id, null: false
      t.integer :from_id, null: false
      t.integer :send_id, null: false
      t.integer :price, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end