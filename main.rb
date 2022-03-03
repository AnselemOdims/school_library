require_relative './book'
require_relative './person'

# list all books
def list_books
  books = Book.all
  if books.empty?
    puts 'No books available. Please add books'
  else
    books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end
end

# list all people
def list_people
  people = Person.all
  if people.empty?
    puts 'No person available. Please add  teacher or student'
  else
    people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end
end

# create a person
def create_person(type, name, age, perm)
  if type == 'student'
    if perm == 'y'
      student = Student.new(age, name, true)
    else
      student = Student.new(age, name, false)
    end
  else 
    teacher = Teacher.new(perm, age, name)
  end
end

# create a book
def create_book(title, author)
  book = Book.new(title, author)
end

# create a rental
def create_rental(date, person_id, book_id)
  book = Book.all[book_id.to_i]
  person = Person.all[person_id.to_i]
  rental = Rental.new(date, book.title, book.author)
  person.add_rental(rental)
end

# list all rentals for a given person ID
def list_rental(id)
  Person.all.find_all{|person| person.id == id.to_i}
end

# display welcome message
def welcome 
  puts "Welcome to School Library App!"
end

# display a list of options
def choose
  puts "Please choose an option by entering a number: "
  puts "1 - List all books"
  puts "2 - List all people"
  puts "3 - Create a person"
  puts "4 - Create a book"
  puts "5 - Create a rental"
  puts "6 - List all of rentals for a given person id"
  puts "7 - Exit"
end 

# define the entry point method
def main
  2.times {|n| puts ''}
  choose
  num = gets.chomp
end

welcome
main