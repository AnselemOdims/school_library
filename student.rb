require_relative './person'

class Student < Person
  attr_accessor :classroom

  @@students = []

  def initialize(age, name = 'Unknown', parent_permission = true, *classroom)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    @@students << self
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def self.all
    @@students
  end
end
