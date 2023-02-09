require './student'
require './classroom'

describe Student do
  let(:student) { Student.new(24) }
  let(:classroom) { double('Classroom') }

  describe '#initialize' do
    it 'sets the age' do
      expect(student.age).to eq 24
    end

    it 'sets the name to "Unknown" by default' do
      expect(student.name).to eq 'Unknown'
    end

    it 'sets the parent permission to true by default' do
      expect(student.parent_permission).to eq true
    end

    context 'When the is provided' do
      let(:student) { Student.new(24, 'Ben') }

      it 'sets the name' do
        expect(student.name).to eq 'Ben'
      end
    end

    context 'When parent permission is false' do
      let(:student) { Student.new(24, 'Ben', parent_permission: false) }

      it 'sets the parent permission to false' do
        expect(student.parent_permission).to eq false
      end
    end
  end

  describe '#classroom=' do
    before do
      allow(classroom).to receive(:students) { [] }
      allow(classroom).to receive(:add_student).with(student)
    end

    it 'sets the classroom' do
      student.classroom = classroom
      expect(student.classroom).to eq classroom
    end

    it 'adds the student to the classroom students' do
      expect(classroom).to receive(:add_student).with(student)
      student.classroom = classroom
    end
  end

  describe '#play_hoocky' do
    it 'returns pattern' do
      expect(student.play_hoocky).to eq '¯(ツ)/¯'
    end
  end

  describe '#to_json' do
    it 'returns hash representation of student' do
      expect(student.to_json).to eq(
        {
          'id' => student.id,
          'name' => 'Unknown',
          'age' => 24,
          'classroom' => nil,
          'parent_permission' => true,
          'class' => 'Student'
        }
      )
    end
  end
end
