require 'json'

module List
  def list_books
    books = JSON.parse(File.read('books.json'))
    if books.empty?
      puts 'No books available. Please add books'
    else
      books.each do |book|
        puts "Title: \"#{book.title}\", Author: #{book.author}"
      end
    end
  end

  def list_people
    people = JSON.parse(File.read('persons.json'))
    if people.empty?
      puts 'No person available. Please add  teacher or student'
    else
      people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end
end