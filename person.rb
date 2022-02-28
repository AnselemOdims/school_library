class Person
  def initialize(name = 'Unknown', age, parent_permission: true)
    @id = Random.rand(1..500)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def id
    @id
  end

  def name
    @name
  end

  def age
    @age
  end

  def name=(value)
    @name = value
  end 

  def age=(value)
    @age = value
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  private
  
  def is_of_age?
    @age >= 18
  end
end

man = Person.new('John', 18)

puts man.can_use_services?