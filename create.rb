module Create
  def create_student
    print 'age:'
    age = gets.chomp
    print 'Name:'
    name = gets.chomp
    print 'Has parent permission ? [Y/N]'
    parent_permission = gets.chomp.downcase

    case parent_permission
    when 'y'
      student = Student.new(age, name)
      puts 'Person created successfully'
      @people.push(student)

    when 'n'
      student = Student.new(age, name, parent_permission: false)
      puts 'Person created successfully'
      @people.push(student)

    else
      puts 'Please enter a valid option'
      create_student
    end
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

  def create_book
    print 'enter book title:'
    title = gets.chomp
    print 'enter book author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
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
end
