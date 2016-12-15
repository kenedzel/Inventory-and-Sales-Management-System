json.extract! delivery, :id, :item_id, :quantity, :quantity_before_delivery, :quantity_after_delivery, :created_at, :updated_at
json.url delivery_url(delivery, format: :json)