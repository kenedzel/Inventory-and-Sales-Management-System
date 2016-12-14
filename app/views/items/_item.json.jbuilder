json.extract! item, :id, :name, :code, :category_id, :cost_price, :stock, :status, :created_at, :updated_at
json.url item_url(item, format: :json)
