json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :active
  json.url customer_url(customer, format: :json)
end
