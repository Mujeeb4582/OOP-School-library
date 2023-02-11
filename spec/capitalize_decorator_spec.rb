require './capitalize_decorator'

describe CapitalizeDecorator do
  let(:nameable) { double('Nameable', correct_name: 'correct name') }
  let(:capitalize_decorator) { CapitalizeDecorator.new(nameable) }

  describe '#correct_name' do
    it 'capitalizes the correct_name returned by the nameable object' do
      expect(capitalize_decorator.correct_name).to eq 'Correct name'
    end
  end
end
