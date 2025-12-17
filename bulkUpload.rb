require 'csv'
require 'json'
require 'net/http'
require 'uri'

# Rails default port
uri = URI('http://100.49.101.253/markets.json')

CSV.foreach('items.csv', headers: true) do |row|
  data = {
    market: {
      name:        row['name'],
      description: row['description'],
      price:       row['price'],
      stock:       row['stock'],
      image_url:   row['image_url']
    }
  }

  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Post.new(uri.path, { 'Content-Type' => 'application/json' })
  request.body = data.to_json

  response = http.request(request)

  puts "[#{response.code}] #{row['name']} => #{response.body}"
end
