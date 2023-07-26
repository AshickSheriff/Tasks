# #without parameter
#      def test
#         puts "Method Start"
#         yield
#         puts "Method End"
#      end

#      test{
#         puts "In The Block"
#      }

     #with parameter
# def test
#     puts "Method Start"
#     yield('Hi AQ',3)
#     puts "Method End"
# end

#     test{
#        |name,id| puts "In The Block "+name+" "+id.to_s
#      }

#block as argument and also pass by reference
def test(&b)
puts "Method Start"
    #yield
    b.call
    3.times do (b.call)
    end 
puts "Method End"             
end
        
test{   
    puts "In The Block (Argument) "     #This is Closure
 }