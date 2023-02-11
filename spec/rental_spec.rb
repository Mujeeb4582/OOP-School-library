require './rental'

describe Rental do
  let(:book) { { 'title' => 'The Great Gatsby', 'author' => 'F. Scott Fitzgerald' } }
  let(:person) { { 'id' => 1, 'name' => 'John Doe' } }
  let(:date) { '2023-02-10' }
  subject(:rental) { Rental.new(book, person, date) }

  describe '#initialize' do
    it 'sets the book' do
      expect(rental.book).to eq(book)
    end

    it 'sets the person' do
      expect(rental.person).to eq(person)
    end

    it 'sets the date' do
      expect(rental.date).to eq(date)
    end
  end

  describe '#to_json' do
    it 'returns a hash representation of the rental object' do
      expected_output = {
        'date' => date,
        'person_id' => person['id'],
        'book_title' => book['title'],
        'book_author' => book['author'],
        'class' => Rental.name
      }

      expect(rental.to_json).to eq expected_output
    end
  end
end
