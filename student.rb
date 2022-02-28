require_relative './person'

class Student < Person
  def initialize(classroom)
    super
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

john = Student.new('june')

puts john.play_hooky
