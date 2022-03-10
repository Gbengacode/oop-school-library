require_relative '../book'

describe do
  context 'When testing the book class do' do
    title = 'mytitle'
    author = 'myauthor'
    it 'it should return an instance of the class' do
      new_book = Book.new(title, author)
      expect(new_book).to be_instance_of(Book)
    end
    it 'should return the title passed in the class instance' do
      new_book = Book.new(title, author)
      expect(new_book.title).to equal(title)
    end

    it 'should return the author passed in the class instance' do
      title = 'mytitle'
      author = 'myauthor'
      new_book = Book.new(title, author)
      expect(new_book.author).to equal(author)
    end
  end
end
