require_relative 'corrector'
class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name: 'Unknown', parent_permission: true)
    @corrector = Corrector.new
    @id = ''
    @name = validate_name(name)
    @age = age
    @parent_permission = parent_permission
  end

  private

  def of_age?
    return true if age >= 18

    false
  end

  public

  def can_use_services?
    return true if of_age? || @parent_permission

    false
  end

  def validate_name(name)
    @corrector.correct_name(name)
  end
end

person = Person.new(18, name: 'gabriel Rendon')
p person
