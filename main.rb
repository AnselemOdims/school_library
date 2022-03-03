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
