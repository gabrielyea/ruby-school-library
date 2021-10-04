require_relative 'person'

class Teacher < Person
  def initialize(speialization, age, **optional_data)
    @speialization = speialization
    super(age, **optional_data)
  end

  def can_use_services?
    true
  end
end
