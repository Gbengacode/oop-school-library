require_relative('./corrector')
require_relative('./rental')
# rubocop:disable Style/ClassVars
class Person
  attr_accessor :name, :age, :rentals, :id
 

  @@id = 1
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = @@id
    @@id += 1
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    @parent_permision || of_age?
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'age' => @age,
      'name' => @name,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end

  def add_rental(book, date)
    Rental.new(date, self, book)
  end
  private :of_age?
end
# rubocop:enable Style/ClassVars
