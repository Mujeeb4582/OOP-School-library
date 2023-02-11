require './nameable'

class Decorator < Nameable
  attr_accessor :name

  def initialize(nameable = 'Unknown')
    super()
    @nameable = nameable || 'Unknown'
  end

  def correct_name
    @nameable.respond_to?(:correct_name) ? @nameable.correct_name : 'Unknown'
  end
end
