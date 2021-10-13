class ClassRoom
  attr_accessor :label
  attr_reader :students

  def initialize(label:)
    @label = label
    @students = []
  end

  def add_student(student)
    return if @students.include?(student)

    @students.push(student)
    student.classroom = self
  end

  def to_json(*options)
    {
      'label' => @label,
      'students' => @students
    }.to_json(*options)
  end
end
