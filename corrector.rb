class Corrector
  attr_accessor :component

  def initialize(component)
    @component = component
  end

  def operation
    correct_name(@component.name)
  end

  def correct_name(name)
    @component.name = name.capitalize.slice(0..9)
  end
end
