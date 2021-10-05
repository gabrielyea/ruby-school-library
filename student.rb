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

student = Student.new('101', age: 20, name: 'daniel Cosi', parent_permission: false)
p student
