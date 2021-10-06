require_relative 'decorator'
class Corrector < Decorator
  attr_accessor :component

  def initialize(component)
    @component = component
    super
  end

  def operation
    correct_name(@component.name)
  end

  def correct_name(name)
    @component.name = name.capitalize.slice(0..9)
  end
end
