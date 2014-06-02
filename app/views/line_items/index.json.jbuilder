json.array!(@line_items) do |line_item|
  json.extract! line_item, :id, :purchase_id, :product_id, :quantity, :cost
  json.url line_item_url(line_item, format: :json)
end
