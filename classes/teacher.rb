require_relative 'person'

class Teacher < Person
  def initialize(specialization:, **options)
    @specialization = specialization
    super(**options)
  end

  def can_use_services?
    true
  end

  def to_json(*options)
    {
      type: self.class,
      id: @id,
      name: @name,
      age: @age,
      specialization: @specialization
    }.to_json(*options)
  end
end
