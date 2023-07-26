class Aq 
    def initialize(name,num)
        @name=name              # default_constructor
        @num =num
    end

    def display
        puts "name : #{@name} and Num : #{@num}"
    end

end
 
a=Aq.new("Asiq",7)
a.display