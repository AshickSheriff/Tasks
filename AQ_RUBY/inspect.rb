class Aq
    attr_accessor :name , :task

    def initialize(name,task)
        @name=name
        @task=task
    end

    def display
        puts name.inspect
        puts task.inspect
    end

end
    name=gets.chomp
    task=gets.chomp

    a=Aq.new(name,task)
    
    a.display