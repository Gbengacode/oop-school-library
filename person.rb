class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'unknown', parent_permision: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permision = parent_permision
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    @parent_permision || of_age?
  end
  private :of_age?
end
