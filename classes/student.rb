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
end
