require 'json'

module List
  # list all books
  def list_books
    books = JSON.parse(File.read('books.json'))
    if books.empty?
      puts 'No books available. Please add books'
    else
      books.each do |book|
        puts "Title: \"#{book['title']}\", Author: #{book['author']}"
      end
    end
  end

  # list all people
  def list_people
    people = JSON.parse(File.read('persons.json'))
    if people.empty?
      puts 'No person available. Please add  teacher or student'
    else
      people.each do |person|
        puts "[#{person['type']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
      end
    end
  end

  # list all rentals for a given person ID
  def list_rental
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals: '
    rentals = JSON.parse(File.read('persons.json')).find { |person| person['id'] == id }['rentals']
    if rentals.empty?
      puts "Person with ID #{id} has no rentals yet"
    else
      rentals.each { |rental| puts "Date: #{rental['date']}, Book: \"#{rental['title']}\" by #{rental['author']}" }
    end
  end
end
