class Decorator
  attr_accessor :component

  def initialize(component)
    @component = component
    super()
  end

  def operation
    @component.operation
  end
end
