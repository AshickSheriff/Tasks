class Employee
    attr_accessor :name, :age, :date_of_join, :rating, :reporting_to
     def initialize(name, age, date_of_join, rating, reporting_to)
      @name = name
      @age = age
      @date_of_join = date_of_join
      @rating = rating
      @reporting_to = reporting_to
    end
     def reporting
      puts "#{name} is reporting to #{reporting_to}."
    end
     def apply_leave
      puts "#{name} has applied for leave."
    end
     def ==(other)
      rating == other.rating && date_of_join == other.date_of_join
    end
end

   class EmpManagement
    attr_accessor :employees
     def initialize
      @employees = []
    end
     def add_employee
      puts "Enter employee details:"
      print "Name: "
      name = gets.chomp
      print "Age: "
      age = gets.chomp.to_i
      print "Date of Joining (YYYY-MM-DD): "
      date_of_join = gets.chomp
      print "Rating: "
      rating = gets.chomp.to_f
      print "Reporting To: "
      reporting_to = gets.chomp
       employee = Employee.new(name, age, date_of_join, rating, reporting_to)
      employees.push(employee)
      puts "#{name} has been added as an employee."
    end

     def remove_employee
      puts "Enter the name of the employee to remove:"
      name = gets.chomp
      index = employees.find_index { |employee| employee.name == name }
      if index
        removed_employee = employees.delete_at(index)
        puts "#{removed_employee.name} has been removed as an employee."
      else
        puts "Employee not found."
      end
    end

     def list_employees
      puts "List of Employees:"
      employees.each do |employee|
        puts "- #{employee.name}"
      end
    end

     def employee_reporting
      puts "Enter the name of the employee to get reporting information:"
      name = gets.chomp
      employee = employees.find { |employee| employee.name == name }
      if employee
        employee.reporting
      else
        puts "Employee not found."
      end
    end

     def apply_leave
      puts "Enter the name of the employee to apply for leave:"
      name = gets.chomp
      employee = employees.find { |employee| employee.name == name }
      if employee
        employee.apply_leave
      else
        puts "Employee not found."
      end
    end

     def compare_employees
      puts "Enter the names of the two employees to compare:"
      print "Employee 1: "
      name1 = gets.chomp
      print "Employee 2: "
      name2 = gets.chomp
       employee1 = employees.find { |employee| employee.name == name1 }
       employee2 = employees.find { |employee| employee.name == name2 }
       if employee1 && employee2
        if employee1 == employee2
          puts "#{employee1.name} and #{employee2.name} have the same rating and date of joining."
        else
          puts "#{employee1.name} and #{employee2.name} have different rating or date of joining."
        end
      else
        puts "One or both employees not found."
      end
    end
  end


   aq = EmpManagement.new

   loop do 
    puts "\n1. Add Employee"
    puts "2. Remove Employee"
    puts "3. List Employees"
    puts "4. Employee Reporting"
    puts "5. Apply Leave"
    puts "6. Compare Employees"
    puts "7. Exit"
    puts "Enter Your Choice:"
     choice = gets.chomp.to_i

case choice
    when 1
      aq.add_employee
    when 2
      aq.remove_employee
    when 3
      aq.list_employees
    when 4
      aq.employee_reporting
    when 5
      aq.apply_leave
    when 6
      aq.compare_employees
    when 7
      break
    else
      puts "Invalid Choice!"
    end
  end