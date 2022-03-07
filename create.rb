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

end
