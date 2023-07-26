class States   
    @@no_of_states=0   #Class variable
    def initialize(name)   
       @states_name=name   #instance variable
       @@no_of_states += 1   
    end   

    def display()   
      puts "State name :#{@states_name}"   #restricted to particular instance
     end   

     def total_states()   
        puts "Total number of states written: #@@no_of_states"   
     end   

     puts "Outside of Method #@@no_of_states \n"

    puts "Calling  Inst_Var in Class : #{@states_name} \n"

 end   
 puts "Enter State Name :"
 name=gets.chomp
 a=States.new(name)

 a.display
 a.total_states
 a.display

