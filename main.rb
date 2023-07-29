require_relative 'app'

class LibraryApp
  OPTIONS = {
    '1' => :list_books,
    '2' => :list_people,
    '3' => :create_person,
    '4' => :create_book,
    '5' => :create_rental,
    '6' => :list_rentals_by_person_id,
    '7' => :exit_app
  }.freeze

  def initialize
    @app = App.new
  end

  def welcome_message
    puts 'Welcome to School library App!'
  end

  def display_menu
    puts "\nPlease enter a number: "
    OPTIONS.each { |index, string| puts "#{index} - #{string.capitalize}" }
  end

  def handle_option(option)
    action = OPTIONS[option]
    if action
      send(action)
    else
      puts 'You are out of range'
    end
  end

  def list_books
    @app.list_books
  end

  def list_people
    @app.list_people
  end

  def create_person
    @app.create_person
  end

  def create_book
    @app.create_book
  end

  def create_rental
    @app.create_rental
  end

  def list_rentals_by_person_id
    @app.list_rentals_by_person_id
  end

  def exit_app
    puts 'You made a good choice'
    exit
  end

  def main
    welcome_message
    loop do
      display_menu
      option = gets.chomp
      handle_option(option)
    end
  end
end

LibraryApp.new.main
