require_relative('./person')
require_relative('./student')
require_relative('./book')
require_relative('./teacher')
require_relative('./rental')

@books = []
@people = []
def list_book
  if @books.length.zero?
    puts 'Book list is empty, Please add book'

  else
    @books.each_with_index do |book, index|
      puts "[Book] #{index + 1} - Title: #{book.title}, Author: #{book.author}"
    end
  end
end

def list_people
  if @people.length.zero?
    puts "There's no person, Please add a person first"
    main_method
  else
    @people.each_with_index do |person, index|
      if person.is_a?(Teacher)
        puts "[Teacher] #{index + 1} - Name: #{person.name}, Age: #{person.age}"
      else
        puts "[Student] #{index + 1} - Name: #{person.name}, Age: #{person.age}"
      end
    end
  end
end

def list_rental
  puts 'Select a person by number: '
  list_people
  main_method if @people.length.zero?
  person_index = gets.chomp.to_i
  rentals = @people[person_index - 1].rentals
  if rentals.length.zero?
    puts 'No rentals for this selected person, Add rental'
  else
    rentals.each_with_index do |rent, index|
      puts "#{index + 1} - Date: #{rent.date}, Book: #{rent.book.title} was rented by #{rent.person.name}"
    end
  end
end

def create_rental
  puts 'Select a book by number '
  list_book
  main_method if @books.length.zero?
  book_index = gets.chomp.to_i
  puts 'Select a person by number: '
  list_people
  main_method if @people.length.zero?
  person_index = gets.chomp.to_i
  print 'Enter date: '
  date = gets.chomp
  Rental.new(date, @people[person_index - 1], @books[book_index - 1])
  puts "Rental  succesfully  created-
    book: #{@books[book_index - 1].title}, Person: #{@people[person_index - 1].name}, Date: #{date}"
end

def create_book
  print 'enter book title:'
  title = gets.chomp
  print 'enter book author:'
  author = gets.chomp
  book = Book.new(title, author)
  @books.push(book)
end

def create_teacher
  print 'age:'
  age = gets.chomp
  print 'Name:'
  name = gets.chomp
  print 'Specialization:'
  specialization = gets.chomp
  teacher = Teacher.new(age, name, specialization)
  @people.push(teacher)
  puts 'Teacher successfully created'
end

def permission_checker(parent_permission, age, name)
  case parent_permission
  when 'y'
    student = Student.new(age, name, parent_permission: false)
    puts 'Person created successfully'
    @people.push(student)

  when 'n'
    student = Student.new(age, name)
    puts 'Person created successfully'
    @people.push(student)

  else
    puts 'Please enter a valid option'
    create_student
  end
end

def create_student
  print 'age:'
  age = gets.chomp
  print 'Name:'
  name = gets.chomp
  print 'Has parent permission ? [Y/N]'
  parent_permission = gets.downcase.chomp
  permission_checker(parent_permission, age, name)
end

def create_person
  puts 'Do you want to create a student(1) or a teacher(2)?'
  option = gets.chomp
  case option
  when '1'
    create_student
  when '2'
    create_teacher

  else
    puts 'Please enter a valid option'
  end
end

def display_message(choices)
  puts 'welcome to your school library'
  puts "Please choose an option by entering a number\n"
  puts "#{choices[0]} - list all books"
  puts "#{choices[1]} - list all people"
  puts "#{choices[2]} - create a person"
  puts "#{choices[3]} - create a book"
  puts "#{choices[4]} - create a rental"
  puts "#{choices[5]} - list all rental for a given person id"
  puts "#{choices[6]} - exit program"
end

# rubocop:disable Metrics/CyclomaticComplexity
def user_selection(choice)
  case choice.to_i
  when 1
    list_book
  when 2
    list_people
  when 3
    create_person
  when 4
    create_book
  when 5
    create_rental
  when 6
    list_rental
  when 7
    puts 'Thank you for using this app'
    exit
  else
    puts 'Invalid input, Please enter a valid number'
  end
end
# rubocop:enable Metrics/CyclomaticComplexity

def main_method
  choices = [1, 2, 3, 4, 5, 6, 7]
  display_message(choices)
  choice = gets.chomp
  user_selection(choice)
  main_method
end
main_method
