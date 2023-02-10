require './teacher'

describe Teacher do
  let(:teacher) { Teacher.new('Math', 35) }

  describe '#initialize' do
    it 'sets the specialization' do
      expect(teacher.specialization).to eq('Math')
    end

    it 'sets the age' do
      expect(teacher.age).to eq(35)
    end

    it 'sets the name to "Unknown" by default' do
      expect(teacher.name).to eq('Unknown')
    end

    it 'sets the parent permission to true by default' do
      expect(teacher.parent_permission).to be true
    end

    context 'When the name is provided' do
      let(:teacher) { Teacher.new('Math', 35, 'Ali') }

      it 'sets the name' do
        expect(teacher.name).to eq('Ali')
      end
    end

    context 'when parent permission is false' do
      let(:teacher) { Teacher.new('Math', 35, 'John', parent_permission: false) }

      it 'sets the parent permission' do
        expect(teacher.parent_permission).to be false
      end
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(teacher.can_use_services?).to be true
    end
  end

  describe '#to_json' do
    it 'returns hash representation of the teacher' do
      expect(teacher.to_json).to eq(
        {
          'id' => teacher.id,
          'name' => 'Unknown',
          'age' => 35,
          'specialization' => 'Math',
          'parent_permission' => true,
          'class' => 'Teacher'
        }
      )
    end
  end
end
