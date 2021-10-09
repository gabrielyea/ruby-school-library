require_relative 'corrector'
require_relative 'rental'
class Person
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age:, name: 'Unknown', parent_permission: true)
    @corrector = Corrector.new
    @id = rand 0..999
    @name = validate_name(name)
    @age = age
    @parent_permission = parent_permission
    @rentals = []
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

  def add_rental(book, date)
    Rental.new(date, self, book)
  end
end
