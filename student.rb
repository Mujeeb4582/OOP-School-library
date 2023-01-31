require './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hoocky
    '¯(ツ)/¯'
  end
end

student = Student.new('six', 12, 'Mujeeb')
p student.classroom
p student.name
p student.age
p student.can_use_services?
p student.play_hoocky
