require_relative('./rental')
# rubocop:disable Style/ClassVars
class Book
  @@id = 1
  attr_accessor :title, :author, :rentals, :id

  def initialize(title, author)
    @id = @@id
    @@id += 1
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, person, self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'title' => @title,
      'author' => @author
    }.to_json(*args)
  end
end
# rubocop:enable Style/ClassVars
