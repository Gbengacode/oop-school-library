require_relative('./list')
require_relative('./save_data')



module Create
  def self.permission_checker(parent_permission, age, name, store)
    case parent_permission
    when 'y'
      student = Student.new(age, name)
      store.save(student)
      puts 'Person created successfully'
      SaveData.save_person(store)
    when 'n'
      student = Student.new(age, name, parent_permission: false)
      store.save(student)
      SaveData.save_person(store)
  
      puts 'Person created successfully'
  
    else
      puts 'Please enter a valid option'
      Create.create_student(store)
    end
  end

  def self.create_student(store)
    print 'age:'
    age = gets.chomp
    print 'Name:'
    name = gets.chomp
    print 'Has parent permission ? [Y/N]'
    parent_permission = gets.chomp.downcase
    permission_checker(parent_permission, age, name, store)
  end

  def self.create_teacher(store)
    print 'age:'
    age = gets.chomp
    print 'Name:'
    name = gets.chomp
    print 'Specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    store.save(teacher)
    SaveData.save_person(store)
    puts 'Teacher successfully created'
  end

  def self.create_person(store)
    puts 'Do you want to create a student(1) or a teacher(2)?'
    option = gets.chomp
    case option
    when '1'
      Create.create_student(store)
    when '2'
      Create.create_teacher(store)

    else
      puts 'Please enter a valid option'
    end
  end

  def self.create_book(store)
    print 'enter book title:'
    title = gets.chomp
    print 'enter book author:'
    author = gets.chomp
    book = Book.new(title, author)
    store.save(book)
    SaveData.save_book(store)
  end

  def self.create_rental(store)
    puts 'Select a book by number '
    store.list_book
    Create.create_book(store) if store.books.length.zero?
    book_index = gets.chomp.to_i
    puts 'Select a person by number: '
    store.list_people
    create_people(store) if store.people.length.zero?
    person_index = gets.chomp.to_i
    print 'Enter date: '
    date = gets.chomp
   
    new_rent = Rental.new(date, store.people[person_index - 1], store.books[book_index - 1])
    store.save_rental(new_rent)
    SaveData.save_rental(store)
    puts "Rental  succesfully  created-
      book: #{store.books[book_index - 1].title}, Person: #{store.people[person_index - 1].name}, Date: #{date}"
  end
end
