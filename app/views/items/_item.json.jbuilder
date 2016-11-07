json.extract! item, :id, :name, :code, :category_id, :retail_price, :cost_price, :stock, :status, :created_at, :updated_at
json.url item_url(item, format: :json)