require_relative './person'

class Teacher < Person
  attr_reader :specialization
  @@teachers = []

  def initialize(specialization, age, name = 'Unknown')
    super(age, name)
    @specialization = specialization
    @@teachers << self
  end

  def can_use_services?
    true
  end

  def self.all
    @@teachers
  end
end
