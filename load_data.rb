module LoadData
  def self.load_book(store)
    if File.exist?('books.json')
      JSON.parse(File.read('books.json')).map do |book|
        book = Book.new(book['title'], book['author'])
        store.save(book)
      end
    else
      []
    end
  end

  def self.load_person(store)
    if File.exist?('person.json')
      JSON.parse(File.read('person.json')).map do |person|
        individual = if person['json_class'] == 'Teacher'
                       Teacher.new(person['age'], person['specialization'], person['name'])
                     else
                       Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
                     end
        store.save(individual)
      end
    else
      []
    end
  end
  # your turn
end
