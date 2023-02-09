require './book'

class Rental
  def initialize(person, date, book)
    # implementation
  end
end

describe Book do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:person) { 'John Doe' }
  let(:date) { '01/01/2022' }

  before do
    allow(Rental).to receive(:new).with(person, date, book).and_return(rental)
  end

  let(:rental) { double(:rental) }

  describe '#initialize' do
    it 'creates a new book with the given title and author' do
      expect(book.title).to eq('The Great Gatsby')
      expect(book.author).to eq('F. Scott Fitzgerald')
    end

    it 'initializes an empty array of rentals' do
      expect(book.rentals).to eq([])
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the book' do
      book.add_rental(person, date)
      expect(book.rentals.count).to eq(1)
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the book' do
      book.add_rental(person, date)
      json = book.to_json
      expect(json).to eq({
                           'title' => 'The Great Gatsby',
                           'author' => 'F. Scott Fitzgerald',
                           'rentals' => [rental],
                           'class' => 'Book'
                         })
    end
  end
end
