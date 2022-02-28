class Student < Person
  def initialize(classroom)
    super
    @classroom = classroom
  end 