
class Aq
    attr_accessor :thing,:brand

    def initialize(thing,brand)
        @thing=thing
        @brand=brand
    end

    def display

        puts "The Thing He Wears : #{thing}"
        puts "The Brand He Wears : #{brand}"
    end
end

puts "Enter Thing Name :"
thing=gets.chomp
puts "Enter Brand Name : "
brand=gets.chomp
a1=Aq.new(thing,brand)

a1.display


