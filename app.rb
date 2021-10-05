require_relative 'decorator'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'

# class Component
#   def operation
#     raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
#   end
# end

def invoke(component)
  component.operation
end

input_name = 'gabriel asdfasdf'
person = Person.new(name: input_name, age: 10)
p person.name

input_name = 'daniel asdfasdf'
stu = Student.new('110', name: input_name, age: 10)
p stu.name

input_name = 'javier asdfasdf'
tea = Teacher.new('Biology', name: input_name, age: 10)
p tea.name

decorator1 = Corrector.new(person)
decorator2 = Corrector.new(stu)
decorator3 = Corrector.new(tea)

invoke(decorator1)
invoke(decorator2)
invoke(decorator3)

p person.name
p stu.name
p tea.name
