#.map
arr=(1..5).map{|i| i*i }
puts "#{arr}"
#op:[1, 4, 9, 16, 25]


#.collect
arr_1=(1..5).collect {'aq'}
puts "#{arr_1}"
#op:["aq", "aq", "aq", "aq", "aq"]

#.find_all
arr_2=(1..10).find_all {|i| i%2==0}
puts "#{arr_2}"
#op:[2, 4, 6, 8, 10]

#.select
arr_3=(1..10).select {|j| j.even?}
puts "#{arr_3}"
#op:[2, 4, 6, 8, 10]

#.filter
arr_4=[:aq,:mq].filter {|x| x==:aq}
puts "#{arr_4}"
#op:[:aq]
