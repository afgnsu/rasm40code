json.array!(@debts) do |debt|
  json.extract! debt, :id, :name, :item, :amount
  json.url debt_url(debt, format: :json)
end
