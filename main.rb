require_relative 'app'

class LibraryApp
  def initialize
    @content = {
      '1' => 'List all books',
      '2' => 'List all people',
      '3' => 'Create a person (teacher or student)',
      '4' => 'Create a book',
      '5' => 'Create a rental',
      '6' => 'List all rentals for a given person id',
      '7' => 'Exit'
    }
    @app = App.new
  end

  def welcome_message
    puts 'Welcome to School library App!'
  end

  def display_menu
    puts "\nPlease enter a number: "
    @content.each { |index, string| puts "#{index} - #{string}" }
  end

  option = gets.chomp.to_i
  case option
  when 1
    @app.list_books
  when 2
    @app.list_people
  when 3
    @app.create_person
  when 4
    @app.create_book
  when 5
    @app.create_rental
  when 6
    @app.list_rentals_by_person_id
  when 7
    puts 'You made a good choice'
    exit
  else
    puts 'You are out of range'
  end
end

def main
  welcome_message
  loop do
    display_menu
    option = gets.chomp.to_i
    handle_option(option)
  end
end

LibraryApp.new.main
