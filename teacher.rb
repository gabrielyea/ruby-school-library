require_relative 'person'

class Teacher < Person
  def initialize(speialization, age, **options)
    @speialization = speialization
    super(age, **options)
  end

  def can_use_services?
    true
  end
end
