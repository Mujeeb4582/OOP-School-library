class Rental
  attr_accessor :date, :person, :book

  def initialize(book, person, date)
    @date = date
    @person = person
    @book = book
  end

  def to_json(*_args)
    {
      'date' => @date,
      'person_id' => @person['id'],
      'book_title' => @book['title'],
      'book_author' => @book['author'],
      'class' => self.class.name
    }
  end
end
