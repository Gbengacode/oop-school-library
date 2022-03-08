require_relative('./person')
require_relative('./student')
require_relative('./book')
require_relative('./teacher')
require_relative('./rental')
require_relative('./create')
require_relative('./list')

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
def user_selection(choice, store)
  case choice.to_i
  when 1
    store.list_book
  when 2
    store.list_people
  when 3
    Create.create_person(store)
  when 4
    Create.create_book(store)
  when 5
    Create.create_rental(store)
  when 6
    store.list_rental
  when 7
    puts 'Thank you for using this app'
    exit
  else
    puts 'Invalid input, Please enter a valid number'

  end
end
# rubocop:enable Metrics/CyclomaticComplexity

def main_method(store)
  choices = [1, 2, 3, 4, 5, 6, 7]
  display_message(choices)
  choice = gets.chomp
  user_selection(choice, store)
  main_method(store)
end
store = List.new
main_method(store)
