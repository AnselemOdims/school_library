require_relative './student'

class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student
  end
end

chem = Classroom.new("chemistry")
phy = Classroom.new("physics")
john = Student.new(chem, 18, "John")
jane = Student.new(chem, 16, "Jane")
john.classroom = phy
chem.add_student(john)
chem.add_student(jane)
p chem.students.map {|student| student.classroom.label}