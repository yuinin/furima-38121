class RenameSendIdColumnToScheduledDeliveryId < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :send_id, :scheduled_delivery_id
  end
end
