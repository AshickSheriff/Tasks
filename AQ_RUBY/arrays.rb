=begin
#method 1
nums=[1,2,3,4,5]
names=['asiq','musiq','asiqmusiq']
puts "#{nums}"
puts "#{names}"

#method 2
nums_1=Array.new([4,5,6,7,8])
names_1=Array.new(['alpha','beta','gamme'])
puts "#{nums_1}"
puts "#{names_1}"

#n times values in array

aq=Array.new(5,'asiq') 
puts "#{aq}"

aq=Array.new(5,5)
puts "#{aq}"


aq_1=Array(30..40)
puts "#{aq_1}"


#methods
1.length
2.size
3.first
4.last
5.push - indexes last
6.unshift - indexes first
7.pop - removes last
8.shift - removes first
8.at
9.delete - deletes value includes duplicates
10.delete_at - deletes values at index

nums_2=[1,2,3,4,5]

puts nums_2.length
puts nums_2.size
puts nums_2.first
puts nums_2.last

nums2.unshift(0)
nums_2.push(6,7)
puts "#{nums_2}"

nums_2.pop
puts "#{nums_2}"

nums_2.delete_at(3)
puts "#{nums_2}"

nums_2.each_with_index {|val,ind| puts "The value is #{val} and the index is #{ind}"}
=end

nums_3=[1,2,nil,3,nil,4,5,nil]
puts nums_3.size

nums_3=[1,2,nil,3,nil,4,5,nil]
nums_4=nums_3.compact

puts nums_4.size

puts nums_3.compact.size
