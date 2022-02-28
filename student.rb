require_relative './person'

class Student < Person
  def initialize(classroom)
    @classroom = classroom
    super()
  end
  attr_accessor :classroom

  def play_hooky
    "¯\(ツ)/¯"
  end
end
