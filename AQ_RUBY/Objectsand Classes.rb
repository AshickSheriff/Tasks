class Gym #Class is always Camelcase
    def initialize(id,name,age)
        @id=id
        @name=name
        @age=age
    end

    def display
        puts "\nid: #{@id} \nname: #{@name}\nage: #{@age}\n"
    end
end

while 1
    puts "\n1.Enter Details"
    puts "2.List Details"
    puts "3.Exit"
    puts "Enter Your Choice :"
    i=gets.to_i

    case 
    when i==1 
    puts "Enter id:"
    id=gets.chomp.to_i
    puts "Enter Name:"
    name=gets.chomp
    puts "Enter Age:"
    age=gets.chomp.to_i
    p1=Gym.new(id,name,age)
    
    when i==2
        puts "The Client Details" 
        p1.display
    when i==3
        break
    else 
        puts "Invalid Choice !"
    end
end