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
end