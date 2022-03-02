class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date)
    @date = date
    @person = person
    @book = book
    person.rental << self
    book.rental << self
  end
end
