require 'prawn'
require 'json'
require 'uri'
require 'net/http'
require 'axlsx'

class WeatherAPI
  def initialize
    @api_key = 'a60fdb4052msh3e99c03ae16a0f0p1baa4djsncf5d0be24430'
    @api_host = 'weatherapi-com.p.rapidapi.com'
  end

  def get_weather(location)
    url = URI("https://weatherapi-com.p.rapidapi.com/current.json?q=#{location}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = @api_key
    request["X-RapidAPI-Host"] = @api_host

    response = http.request(request)
    return JSON.parse(response.read_body, symbolize_names: true)
  end
end

class WeatherReport
  def initialize
    @weather_data = []
  end

  def add_weather_data(location, temperature, weather_description)
    @weather_data << { location: location, temperature: temperature, weather_description: weather_description }
  end

  def export_to_pdf
    Prawn::Document.generate("weather_report.pdf") do |pdf|
      Prawn::Fonts::AFM.hide_m17n_warning = true
      pdf.text "Weather Report", align: :center, size: 20
      pdf.move_down 20
      @weather_data.each do |user|
        pdf.text "Location: #{user[:location]}"
        pdf.text "Temperature (Celsius): #{user[:temperature]}"
        pdf.text "Weather Description: #{user[:weather_description]}"
        pdf.move_down 20
      end
    end
  end

  def export_to_xlsx
    workbook = Axlsx::Package.new
    workbook.workbook.add_worksheet(name: "Weather Report") do |sheet|
      sheet.add_row(["Location", "Temperature (Celsius)", "Weather Description"])
      @weather_data.each do |user|
        sheet.add_row([user[:location], user[:temperature], user[:weather_description]])
      end
    end
    workbook.serialize("weather_report.xlsx")
  end
end

class UserInputHandler
  def get_user_input(num_users)
    users = []

    num_users.times do |i|
      print "Enter user #{i + 1} location: "
      location = gets.chomp
      users << { location: location }
    end

    return users
  end
end

# Main application logic
puts "Enter the number of users:"
num_users = gets.chomp.to_i

user_input_handler = UserInputHandler.new
users = user_input_handler.get_user_input(num_users)

weather_api = WeatherAPI.new
weather_report = WeatherReport.new

users.each do |user|
  location = user[:location]
  weather = weather_api.get_weather(location)
  temperature = "#{weather[:current][:temp_c]} °C"
  weather_description = weather[:current][:condition][:text]
  weather_report.add_weather_data(location, temperature, weather_description)
end

weather_report.export_to_pdf
weather_report.export_to_xlsx

puts "Weather report exported to weather_report.xlsx and weather_report.pdf."
