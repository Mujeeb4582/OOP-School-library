require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << (self) unless classroom.students.include?(self)
  end

  def play_hoocky
    '¯(ツ)/¯'
  end

  def to_json(*_args)
    {
      'id' => @id,
      'name' => @name,
      'age' => @age,
      'classroom' => @classroom,
      'parent_permission' => @parent_permission,
      'class' => self.class.name
    }
  end
end
