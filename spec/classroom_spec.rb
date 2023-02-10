require './classroom'

describe Classroom do
  let(:classroom) { Classroom.new('A-101') }
  let(:student) { double('Student', classroom: nil) }

  before do
    allow(student).to receive(:classroom=)
  end

  describe '#initialize' do
    it 'creates a new classroom with the given label' do
      expect(classroom.label).to eq('A-101')
    end

    it 'initializes an empty array of students' do
      expect(classroom.students).to eq([])
    end
  end

  describe 'add_student' do
    it 'adds a student to the classroom' do
      classroom.add_student(student)
      expect(classroom.students).to eq([student])
    end

    it 'does not add the same student multiple times' do
      2.times { classroom.add_student(student) }
      expect(classroom.students).to eq([student])
    end

    it 'sets the classroom for the student' do
      classroom.add_student(student)
      expect(student).to have_received(:classroom=).with(classroom)
    end
  end
end
