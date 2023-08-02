require 'json'
require 'fileutils'

class SaveData
  def check_file_exists(filename)
    FileUtils.mkdir_p('./data')
    FileUtils.touch('./data/people.json') if !File.exist?('./data/people.json') && filename == 'people'
    FileUtils.touch('./data/books.json') if !File.exist?('./data/books.json') && filename == 'books'
    FileUtils.touch('./data/rentals.json') if !File.exist?('./data/rentals.json') && filename == 'rentals'
  end

  def save_people(people)
    people_array = []
    people.each do |person|
      person_obj = {
        id: person.id,
        name: person.name,
        age: person.age,
        has_permission: person.parent_permission,
        type: person.type
      }
      if person.type == 'Student'
        person_obj[:classroom] = person.classroom
      else
        person_obj[:specialization] = person.specialization
      end
      people_array << person_obj
    end
    return if people_array.empty?

    check_file_exists('people')
    File.write('./data/people.json', JSON.pretty_generate(people_array))
  end

  def save_books(books)
    books_array = []
    books.each do |book|
      book_obj = {
        title: book.title,
        author: book.author
      }
      books_array << book_obj
    end
    return if books_array.empty?

    check_file_exists('books')
    File.write('./data/books.json', JSON.pretty_generate(books_array))
  end

  def save_rentals(rentals)
    rentals_array = build_rentals_array(rentals)
    return if rentals_array.empty?

    check_file_exists('rentals')
    File.write('./data/rentals.json', JSON.pretty_generate(rentals_array))
  end

  def build_rentals_array(rentals)
    rentals_array = []
    rentals.each do |rental|
      rental_obj = build_rental_object(rental)
      rentals_array << rental_obj
    end
    rentals_array
  end

