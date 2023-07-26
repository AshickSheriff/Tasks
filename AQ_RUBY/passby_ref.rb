def aq_arr(arr)
    arr << 4  # Modifying the array by appending an element
  end
  
  arr = [1, 2, 3] # passing a reference to aq_arr
  aq_arr(arr)
  puts arr.inspect  # Output: [1, 2, 3, 4]

  #The changes will be reflected outside of the method as well
  #pass by value for immutable objects, pass by reference for mutable objects

#pass by value

def Aq(num)
    num += 1 #6
    puts num
  end
  num_1= 5
    Aq(num_1)
  puts num_1

  # Prints the original variable