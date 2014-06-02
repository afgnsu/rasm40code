json.array!(@suppliers) do |supplier|
  json.extract! supplier, :id, :name, :contact_number
  json.url supplier_url(supplier, format: :json)
end
