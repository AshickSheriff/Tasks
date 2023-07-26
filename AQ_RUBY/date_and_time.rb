require 'date'
require 'time'

=begin
d_date = Date.parse('21 july 2023')
#parse converts string into date object

puts "The Date: #{d_date}" #full_date
puts "The year: #{d_date.year}" #year
puts "The Month: #{d_date.mon}" #month
puts "The Day: #{d_date.mday}" #day in a month
puts "The Week_Day: #{d_date.wday}" #day in a week
puts "The Week_Day: #{d_date.yday}" #day in a year

puts d_date.strftime('%a %d %b %Y') # %a - Day, %d - Date, %b - Month, %Y - Year 

=end

t_time =Time.new(04,14,44,'+05:00')

puts t_time.friday?
puts t_time.hour
puts t_time.min
puts t_time.sec

# puts Time.now 
t_time=Time.new
puts t_time.friday?