json.extract! market, :id, :name, :price, :stock, :description, :created_at, :updated_at
json.url market_url(market, format: :json)
