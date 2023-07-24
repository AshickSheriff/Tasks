require 'prawn'
require 'rspec'
require 'excon'
require 'json'
require 'uri'
require 'net/http'
require 'json'
require 'axlsx'

def get_weather(location)
  url = URI("https://weatherapi-com.p.rapidapi.com/current.json?q=#{location}")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request["X-RapidAPI-Key"] = 'a60fdb4052msh3e99c03ae16a0f0p1baa4djsncf5d0be24430'
  request["X-RapidAPI-Host"] = 'weatherapi-com.p.rapidapi.com'

  response = http.request(request)
  return JSON.parse(response.read_body, symbolize_names: true)
end

# Function to export data to PDF format
def export_to_pdf(data)
  Prawn::Document.generate("weather_report.pdf") do |pdf|
    Prawn::Fonts::AFM.hide_m17n_warning = true
    pdf.text "Weather Report", align: :center, size: 20
    pdf.move_down 20
    data.each do |user|
      pdf.text "Location: #{user[:location]}"
      pdf.text "Temperature (Celsius): #{user[:temperature]}"
      pdf.text "Weather Description: #{user[:weather_description]}"
      pdf.move_down 20
    end
  end
end


# Function to export data to XSLX format
def export_to_xlsx(data)
  workbook = Axlsx::Package.new
  workbook.workbook.add_worksheet(name: "Weather Report") do |sheet|
    sheet.add_row(["Location", "Temperature (Celsius)", "Weather Description"])
    data.each do |user|
      sheet.add_row([user[:location], user[:temperature], user[:weather_description]])
    end
  end
  workbook.serialize("weather_report.xlsx")
end


# Function to get user details along with location and weather report
def get_user_weather_details(users)
  weather_data = []
  users.each do |user|
    location = user[:location]
    weather = get_weather(location)
    weather_data << {
      location: location,
      temperature: weather[:current][:temp_c].to_s + ' °C',
      weather_description: weather[:current][:condition][:text]
    }
  end
  return weather_data
end


# Function to get user input using excon HTTP client
def get_user_input(num_users)
  users = []

  num_users.times do |i|
    print "Enter user #{i + 1} location: "
    location = gets.chomp
    users << { location: location }
  end

  return users
end

# Unit testing using RSpec
RSpec.describe "Weather Report" do
  let(:users) { [{ location: "London" }, { location: "New York" }] }

  it "should retrieve weather data for locations" do
    weather_data = get_user_weather_details(users)
    expect(weather_data.size).to eq(users.size)
    expect(weather_data.first).to have_key(:location)
    expect(weather_data.first).to have_key(:temperature)
    expect(weather_data.first).to have_key(:weather_description)
  end
end


  puts "Enter the number of users:"
  num_users = gets.chomp.to_i
  users = get_user_input(num_users)
  weather_data = get_user_weather_details(users)
  export_to_pdf(weather_data)
  export_to_xlsx(weather_data)

  puts "Weather report exported to weather_report.xlsx and weather_report.pdf."
