require_relative '../book'
require_relative '../student'
require_relative '../rental'

describe Rental do
  context 'When testing the Rental class' do
    book_title = 'Lord of the rings'
    book_author = 'Emmanuel'
    book = Book.new(book_title, book_author)
    student = Student.new(12, 'John')
    date = '21/04/2001'
    rental = Rental.new(date, student, book)

    it 'should validate the date of the rental' do
      expect(rental.date).to eq date
    end

    it 'should validate the student of the rental' do
      expect(rental.person).to eq student
    end

    it 'should validate the book of the rental' do
      expect(rental.book).to eq book
    end
  end
end
