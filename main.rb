require_relative('./person')
require_relative('./student')
require_relative('./book')
require_relative('./teacher')
require_relative('./rental')
require_relative('./create')
require_relative('./display')
class App
  def initialize
    @people = []
    @books = []
  end
  include Create
  include Display

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
end

App.new.main_method
