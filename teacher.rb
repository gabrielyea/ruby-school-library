require_relative 'person'

class Teacher < Person
  def initialize(specialization:, **options)
    @specialization = specialization
    super(**options)
  end

  def can_use_services?
    true
  end
end
