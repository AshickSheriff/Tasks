require 'rsolr'
require 'securerandom' # to generate random data

solr = RSolr.connect(url: 'http://localhost:8983/solr/aq') #class provided by the rsolr gem

class Todo
  attr_accessor :id, :title, :completed #getter and setter methods

  #getter : used to retrieve the value of an instance variable from an object
  #setter :used to assign a new value to an instance variable

  def initialize(id:, title:, completed:)
    @id = id
    @title = title
    @completed = completed
  end

  def to_solr_doc
    {
      id: @id,
      title: @title,
      completed: @completed
    }
  end
end

def add_todo(solr, title, completed) 
  new_todo = Todo.new(id: SecureRandom.uuid, title: title, completed: completed)
  solr.add(new_todo.to_solr_doc)
  solr.commit
end

def list_todos(solr) 
  response = solr.get('select', params: { q: '*:*' })
  todos = response['response']['docs']
  todos.each do |todo|
    puts "#{todo['id']} - #{todo['title']} [#{todo['completed']}]"
  end
end

def delete_todo(solr, todo_id)
    solr.delete_by_id(todo_id)
    solr.commit
  end

  loop do
    puts "1. Add Todo"
    puts "2. List Todos"
    puts "3. Delete Todo"
    puts "4. Exit"
    print "Enter your choice: "
    choice = gets.chomp.to_i

  case choice
  when 1
    print "Enter Todo title: "
    title = gets.chomp
    print "Is Todo completed? (true/false): "
    completed = gets.chomp.downcase == 'true'
    add_todo(solr, title, completed)
    puts "Todo added successfully!"
  when 2
    puts "Todos:"
    list_todos(solr) 
  when 4
    print "Enter the Todo ID to delete: "
    todo_id = gets.chomp
    delete_todo(solr, todo_id)
    puts "Todo with ID #{todo_id} deleted successfully!"
  when 4
    break
  else
    puts "Invalid choice. Please try again."
  end

  puts
end
