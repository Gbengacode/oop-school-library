require 'json'
module SaveData
  def self.save_book(store)
    File.write('books.json', JSON.generate(store.books)) if store.books.any?
  end

  def self.save_person(store)
    File.write('person.json', JSON.generate(store.people)) if store.people.any?
  end

  def self.save_rental(store)
    File.write('rental.json', JSON.generate(store.rentals)) if store.rentals.any?
  end
end
