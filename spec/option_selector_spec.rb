require './option_selector'

describe OptionSelector do
  let(:library) { double('Library') }
  let(:option_selector) { OptionSelector.new }

  describe '#available_options' do
    context 'when user chooses 1' do
      it 'lists books' do
        expect(library).to receive(:list_books)
        option_selector.available_options(1, library)
      end
    end

    context 'when user chooses 2' do
      it 'lists people' do
        expect(library).to receive(:list_people)
        option_selector.available_options(2, library)
      end
    end

    context 'when user chooses 3' do
      it 'creates a person' do
        expect(library).to receive(:create_person)
        option_selector.available_options(3, library)
      end
    end

    context 'when user chooses 4' do
      it 'creates a book' do
        expect(library).to receive(:create_book)
        option_selector.available_options(4, library)
      end
    end

    context 'when user chooses 5' do
      it 'creates a rental' do
        expect(library).to receive(:create_rental)
        option_selector.available_options(5, library)
      end
    end

    context 'when user chooses 6' do
      it 'lists rentals' do
        expect(library).to receive(:list_rentals)
        option_selector.available_options(6, library)
      end
    end

    context 'when user chooses anything else' do
      it 'exits the app' do
        expect { option_selector.available_options(7, library) }.to raise_error(SystemExit)
      end
    end
  end
end
