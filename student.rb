require_relative 'person'

class Student < Person
  def initialize(classroom, age, **options)
    puts options.inspect
    @classroom = classroom
    super(age, **options)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

student = Student.new('101', 20, name: 'daniel Cosi', parent_permission: false)
p student
