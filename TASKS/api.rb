require 'uri'
require 'net/http'
require 'json'

url = URI("https://weatherapi-com.p.rapidapi.com/current.json?q=chennai")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["X-RapidAPI-Key"] = 'a60fdb4052msh3e99c03ae16a0f0p1baa4djsncf5d0be24430'
request["X-RapidAPI-Host"] = 'weatherapi-com.p.rapidapi.com'

response = http.request(request)
puts JSON.parse(response.read_body, symbolize_names: true)
