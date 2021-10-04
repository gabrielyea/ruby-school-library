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

person1 = Student.new('class', 10, name: 'gabriel', parent_permission: true)
p person1.play_hooky
