require './person'

describe Person do
  let(:date) { '01/01/2022' }

  describe '#initialize' do
    context 'when name is not provided' do
      it "creates a new person with age and 'Unknown' name" do
        person = Person.new(20)
        expect(person.name).to eq('Unknown')
        expect(person.age).to eq(20)
      end
    end

    context 'when name is provided' do
      it 'creates a new person with the given name and age' do
        person = Person.new(25, 'John Doe')
        expect(person.name).to eq('John Doe')
        expect(person.age).to eq(25)
      end
    end

    context 'when parent_permission is not provided' do
      it 'creates a new person with parent_permission set to true' do
        person = Person.new(20)
        expect(person.instance_variable_get(:@parent_permission)).to be true
      end
    end

    context 'when parent_permission is provided' do
      it 'creates a new person with the given parent_permission' do
        person = Person.new(20, 'John Doe', parent_permission: false)
        expect(person.instance_variable_get(:@parent_permission)).to be false
      end
    end

    it 'initializes an empty array of rentals' do
      person = Person.new(20)
      expect(person.rentals).to eq([])
    end
  end

  describe '#add_rentals' do
    it 'adds a rental to the person' do
      person = Person.new(20)
      book = double('Book')
      rental = double('Rental')
      allow(Rental).to receive(:new).with(book, date, person).and_return(rental)
      person.add_rentals(book, date)
      expect(person.rentals).to eq([rental])
    end
  end

  describe '#correct_name' do
    it "returns the person's name" do
      person = Person.new(20, 'John Doe')
      expect(person.correct_name).to eq('John Doe')
    end
  end

  describe '#can_use_services?' do
    context 'when person is age >= 18' do
      it 'returns true' do
        person = Person.new(20)
        expect(person.can_use_services?).to be true
      end
    end

    context 'when person is age < 18' do
      context 'when person has parent permission' do
        it 'returns true' do
          person = Person.new(15)
          expect(person.can_use_services?).to be true
        end
      end

      context 'when person does not have parent permission' do
        it 'returns false' do
          person = Person.new(15, 'John Doe', parent_permission: false)
          expect(person.can_use_services?).to be false
        end
      end
    end
  end
end
