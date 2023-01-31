require './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name = 'Unknown')
    super(age, name)
    @classroom = classroom
  end

  def play_hocky
    '¯(ツ)/¯'
  end
end

student = Student.new('six', 12, 'Mujeeb')
p student.classroom
p student.name
p student.age
p student.can_use_services?
p student.play_hocky
