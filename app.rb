require './book_services'
require './person_services'
require './rental_services'
require './book'
require './student'
require './rental'
require './teacher'

class App
  def initialize
    @books = BookService.new
    @people = PersonService.new
    @rentals = RentalService.new(@people, @books)
  end

  def list_books
    @books.list
  end

  def list_people
    @people.list
  end

  def create_person
    @people.create_person
  end

  def create_book
    @books.create
  end

  def create_rental
    @rentals.create
  end

  def list_rentals
    @rentals.list
  end
end
