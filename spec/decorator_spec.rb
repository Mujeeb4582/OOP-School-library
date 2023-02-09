require './decorator'

describe Decorator do
  describe '#correct_name' do
    context 'when nameable object is provided' do
      let(:nameable) { double('Nameable', correct_name: 'Correct Name') }
      let(:decorator) { Decorator.new(nameable) }

      it 'calls correct_name on the nameable object' do
        expect(decorator.correct_name).to eq 'Correct Name'
      end
    end

    context 'when nameable object is not provided' do
      let(:decorator) { Decorator.new }

      it 'returns Unknown' do
        expect(decorator.correct_name).to eq 'Unknown'
      end
    end
  end
end
