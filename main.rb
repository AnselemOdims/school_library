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
  if num == '1'
    list_books
    main
  elsif num == '2'
    list_people
    main
  elsif num == '3'
    print "Do you want to create a student (1) or a teacher (2)? [Input the number]: "
    option = gets.chomp
    if option == '1'
      print "Age: "
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp
      create_person('student', name, age, permission)
      puts "Person created successfully"
      main
    else 
      print "Age: "
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp
      create_person('teacher', name, age, specialization)
      puts "Person created successfully"
      main
    end
  elsif num == '4'
      print 'Title: '
      title = gets.chomp
      print 'Author: '
      author = gets.chomp
      create_book(title, author)
      puts "Book created successfully"
      main
  elsif num == '5'
      books = Book.all
      if books.empty?
      puts "No books added yet. Please add books to shelf"
      else
        puts 'Select a book from the following list by number '
        books.each_with_index do |book, ind|
          puts "#{ind}) Title: \"#{book.title}\", Author: #{book.author}"
        end
        book_id = gets.chomp
        puts 'Select a person from the following list by number (not id)'
        people = Person.all
        people.each_with_index do |person, ind| 
          puts "#{ind}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
        person_id = gets.chomp
        print 'Date: '
        date = gets.chomp
        create_rental(date, person_id, book_id)
        puts 'Rental created successfully'
      end
      main
  elsif num == '6'
    print 'ID of person: '
    id = gets.chomp
    puts 'Rentals: '
    rentals = list_rental(id)
    rentals.each do |rental|
      rental.rentals.each do |rent|
        puts "Date: #{rent.date}, Book: \"#{rent.book}\" by #{rent.person}"
      end
    end
    main
  else
    return
  end
end

welcome
main