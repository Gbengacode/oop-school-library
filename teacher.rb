require_relative('./person')

class Teacher < Person
  def initialize(specialization)
    super()
    @specialization = specialization
  end
  
  attr_accessor :specialization
  def can_use_services?
    true
  end
end
