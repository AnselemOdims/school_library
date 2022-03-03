require_relative './book'

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