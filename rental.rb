class Rental
  attr_accessor :date, :person, :book

  def initialize(book, person, date)
    @date = date

    @person = person
    person.rentals << self

    @book = book
    book.rentals << self
  end
end
