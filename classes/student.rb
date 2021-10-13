require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom: nil, **options)
    @classroom = classroom.add_student(self) unless classroom.nil?
    super(**options)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def to_json(*options)
    {
      type: self.class,
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission
    }.to_json(*options)
  end
end
