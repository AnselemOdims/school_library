require_relative './teacher'
require_relative './student'
require_relative './book'

module Create
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    if option == '1'
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp
      Student.new(age, name, permission)
    else
      print 'Specialization: '
      specialization = gets.chomp
      Teacher.new(specialization, age, name)
    end
    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    Book.new(title, author)
    puts 'Book created successfully'
  end

  def add_rental(date, book_id, person_id)
    book = JSON.parse(File.read('books.json'))[book_id]
    person = JSON.parse(File.read('perons.json'))[person_id]
    rental = Rental.new(date, book.title, book.author)
    person.add_rental(rental)
  end

  def create_rental
    books = JSON.parse(File.read('books.json'))
    persons = JSON.parse(File.read('persons.json'))
    if books.empty?
      puts 'No books added yet. Please add books to shelf'
    elsif persons.empty?
      puts 'No people added yet. Please create a new person'
    else
      puts 'Select a book from the following list by number '
      books.each_with_index do |book, ind|
        puts "#{ind}) Title: \"#{book.title}\", Author: #{book.author}"
      end
      book_id = gets.chomp.to_i
      puts 'Select a person from the following list by number (not id) '
      persons.each_with_index do |person, ind|
        puts "#{ind}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
      person_id = gets.chomp.to_i
      print 'Date: '
      date = gets.chomp
      add_rental(date, book_id, person_id)
      puts 'Rental created successfully'
    end
  end
end