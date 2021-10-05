require 'pry'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'

person = Person.new(age: 10, name: 'gabriel')
teacher = Teacher.new('Biology', age: 50)
student = Student.new('101', age: 10)

p student
p teacher
p person

binding.pry