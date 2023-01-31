require './person'

class Teacher < Person
  attr_reader :specialization

  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

teacher = Teacher.new('software engineering', 30, 'Ali')
p teacher.specialization
p teacher.name
p teacher.age
p teacher.can_use_services?
