class Component
  def operation
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class Person
  attr_accessor :name

  def initialize(name:)
    @name = name
  end

  def operation
    'Person'
  end
end

class Student < Person
  def operation
    'Student'
  end
end

class Teacher < Person
  def operation
    'Teacher'
  end
end

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

class Corrector < Decorator
  def operation
    correct_name(@component.name)
  end

  def correct_name(name)
    name.capitalize.slice(0..8)
  end
end

def invoke(component)
  p component.operation
end

input_name = 'gabriel asdfasdf'
person = Person.new(name: input_name)

p person.name
decorator1 = Corrector.new(person)

invoke(decorator1)
