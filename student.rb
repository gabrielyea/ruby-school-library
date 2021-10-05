require_relative 'person'

class Student < Person
  def initialize(classroom, **options)
    puts options.inspect
    @classroom = classroom
    super(**options)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
