require_relative 'person'

class Teacher < Person
  def initialize(speialization, **options)
    @speialization = speialization
    super(**options)
  end

  def can_use_services?
    true
  end
end
