require 'rsolr'
require 'securerandom'

SOLR_URL = 'http://localhost:8983/solr' # Replace 'todos' with your Solr core name
solr = RSolr.connect(url: SOLR_URL)

class Todo
  attr_accessor :id, :title, :completed

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

def add_todo(title, completed)
  new_todo = Todo.new(id: SecureRandom.uuid, title: title, completed: completed)
  solr.add(new_todo.to_solr_doc)
  solr.commit
end

def list_todos
  response = solr.get('select', params: { q: '*:*' })
  todos = response['response']['docs']
  todos.each do |todo|
    puts "#{todo['id']} - #{todo['title']} [#{todo['completed']}]"
  end
end

# Example usage
loop do
  puts "1. Add Todo"
  puts "2. List Todos"
  puts "3. Exit"
  print "Enter your choice: "
  choice = gets.chomp.to_i

  case choice
  when 1
    print "Enter Todo title: "
    title = gets.chomp
    print "Is Todo completed? (true/false): "
    completed = gets.chomp.downcase == 'true'
    add_todo(title, completed)
    puts "Todo added successfully!"
  when 2
    puts "Todos:"
    list_todos
  when 3
    break
  else
    puts "Invalid choice. Please try again."
  end

  puts
end
