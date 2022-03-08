
require_relative './book'
require_relative './person'
require_relative './teacher'
require_relative './student'
require_relative './rental'
require_relative './list_items'
require_relative './create'

# list all rentals for a given person ID
def list_rental
  print 'ID of person: '
  id = gets.chomp
  puts 'Rentals: '
  rentals = Person.all.find_all { |person| person.id == id.to_i }
  rentals.each do |rental|
    rental.rentals.each do |rent|
      puts "Date: #{rent.date}, Book: \"#{rent.book}\" by #{rent.person}"
    end
  end
end

# display welcome message
def welcome
  puts 'Welcome to School Library App!'
end

# display a list of options
def choose
  puts 'Please choose an option by entering a number: ',
       '1 - List all books',
       '2 - List all people',
       '3 - Create a person',
       '4 - Create a book',
       '5 - Create a rental',
       '6 - List all of rentals for a given person id',
       '7 - Exit'
end

def list(entity)
  include List
  if entity == 'books'
    list_books
  else
    list_people
  end
end

def select_option(num)
 include Create
  case num
  when '1'
    list('books')
  when '2'
    list('people')
  when '3'
    create_person
  when '4'
    create_book
  when '5'
    create_rental
  when '6'
    list_rental
  else
    puts 'Oooopss!! it seems you selected a wrong option. Please try again'
  end
end

# define the entry point method
def main
  2.times { |_n| puts '' }
  choose
  num = gets.chomp
  if num == '7'
    puts 'Thank you for using our service :). We hope to get your feedback soon'
    return
  end
  select_option(num)
  main
end

welcome
main
