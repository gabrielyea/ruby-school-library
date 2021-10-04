require_relative 'person'

class Student < Person
  def initialize(classroom, **optional_data)
    @classroom = classroom
    super(**optional_data)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

person1 = Student.new('class', age: 10, name: 'gabriel', parent_permission: true)
p person1
