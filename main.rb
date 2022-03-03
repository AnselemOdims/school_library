require_relative './book'

# list all books
def list_books
  books = Book.all
  if books.empty?
    puts "No books available. Please add books"
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
    puts "No person available. Please add  teacher or student"
  else
    people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end
end