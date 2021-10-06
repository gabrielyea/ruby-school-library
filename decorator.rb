require_relative 'component'
class Decorator < Component
  attr_accessor :component

  def initialize(component)
    @component = component
    super()
  end

  def operation
    @component.operation
  end
end
