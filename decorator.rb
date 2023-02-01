require './nameable'

class Decorator < Nameable
  attr_accessor :name

  def initialize(nameable = 'Unknown')
    super()
    @nameable = nameable
  end

  def correct_name
    @name.correct_name
  end
end
