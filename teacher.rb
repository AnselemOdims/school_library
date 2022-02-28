require_relative './person.rb'

class Teacher < Person
  def initialize(specialization)
    super
    @specialization = specialization
  end 

  def can_use_services?
    true
  end

end

minus = Teacher.new("water")
puts minus.can_use_services?