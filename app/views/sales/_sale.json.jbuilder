json.extract! sale, :id, :item_id, :quantity, :total_sale, :created_at, :updated_at
json.url sale_url(sale, format: :json)