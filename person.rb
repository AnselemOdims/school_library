require_relative './corrector'

class Person
  attr_accessor :name, :age, :parent_permission, :type
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..500)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
    @type = ''
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def validate_name(name)
    @corrector.correct_name(name)
  end

  def add_rental(rental)
    @rentals << rental
  end

  private

  def of_age?
    @age.to_i >= 18
  end
end
