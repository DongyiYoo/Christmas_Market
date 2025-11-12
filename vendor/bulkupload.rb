require 'csv'
require 'json'
require 'net/http'
require 'uri'

# Rails default port
API_URL = 'http://127.0.0.1:3000/markets'

CSV.foreach('markets.csv', headers: true) do |row|
  payload = {
    market: {
      name:        row['name'],
      description: row['description'],
      price:       row['price'],
      stock:       row['stock'],
      image_url:   row['image_url']
    }
  }

  uri = URI(API_URL)
  request = Net::HTTP::Post.new(uri)
  request['Content-Type'] = 'application/json'
  request.body = payload.to_json

  response = Net::HTTP.start(uri.hostname, uri.port) do |http|
    http.request(request)
  end

  puts "[#{response.code}] #{row['name']} => #{response.body}"
end
