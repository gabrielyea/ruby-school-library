require_relative 'person'

class Student < Person
  def initialize(classroom, age, **optional_data)
    @classroom = classroom
    super(age, **optional_data)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
