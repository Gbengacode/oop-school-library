module Display
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
end
