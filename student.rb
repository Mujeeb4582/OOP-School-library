require './person'

class Student < Person
  attr_reader :classroom

  def initialize(_classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << (self) unless classroom.students.include?(self)
  end

  def play_hoocky
    '¯(ツ)/¯'
  end
end
