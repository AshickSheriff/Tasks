class Gym

    def evolve
         puts 'Gym Persons'
    end    

end

class Person < Gym

    @@persons=0
    def initialize(id,name,age)
        @id=id
        @name=name
        @age=age
        @@persons+=1
    end

    def dis
        puts "Client name is #{@name} and Client age is #{@age}"
    end    

    def count
        @@persons
    end    
  
end  

p1=Person.new(44,"Asiq",21)
p1.dis
p1.count


