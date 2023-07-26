aq=[1,2,33,44,555,666]

#each
aq.each {|x| puts "each :#{x}"} #simply iterate values
puts "\n"
aq.each {|x| puts "each :#{x+1}"} #iterate values with operations
puts "\n"

#map
mq_2=(aq.map {|x| x*2}) #map in original array
puts "map : #{mq_2}"
puts "\n"

#collect
mq_2=(aq.collect {|x| x*2}) #map in original array
puts "Collect:#{mq_2}"
puts "\n"

#select
mq_3=aq.select {|x| x.odd?} #select used in new array
puts " select :#{mq_3}"
puts "\n"

#each_with_index
aq.each_with_index do |x,i| 
 puts "#{i} is number #{x} in the array" #iterrate values with index
end

