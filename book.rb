class Book
  attr_accessor :title, :author
  attr_reader :rentals
  @@books = []

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @@books << self
  end

  def add_rental(rental)
    @rentals << rental
  end

  def self.all
    @@books
  end
end
