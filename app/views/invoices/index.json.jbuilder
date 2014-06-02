json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :purchase_id, :reference_number
  json.url invoice_url(invoice, format: :json)
end
