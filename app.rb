require_relative 'student'
require_relative 'classroom'
require_relative 'rental'
require_relative 'book'

classroom1 = ClassRoom.new('101')
classroom2 = ClassRoom.new('102')

student1 = Student.new(classroom: classroom1, age: 20, name: 'gabriel Longname')
student2 = Student.new(age: 20, name: 'daniel Longname')
student3 = Student.new(classroom: classroom2, name: 'Victor', age: 50)

all_students = [student1, student2, student3]

classroom1.add_student(student1)
classroom2.add_student(student2)
classroom2.add_student(student3)

book1 = Book.new('book2', 'author 1')
book2 = Book.new('book1', 'author 2')

book1.add_rental(student1, 'December')

all_rentals = [Rental.new('march', student1, book1), Rental.new('june', student1, book2),
               Rental.new('july', student2, book1)]

puts ' '
puts '--CLASS 1--'
classroom1.students.each { |student| p student.name }
puts '------'

puts '--CLASS 2--'
classroom2.students.each { |student| p student.name }
puts '------'

puts '--STUDENTS AND CLASSES--'
all_students.each { |student| p("#{student.name} goes to #{student.classroom.label}") }
puts '------'

puts '--RENTALS AND STUDENTS--'
all_rentals.each do |rent|
  p "#{rent.person.name} rented #{rent.book.title} on #{rent.date}"
end
puts '------'

puts '--RENTALS FROM BOOK--'
book1.rentals.each do |rent|
  p "#{rent.person.name} rented #{rent.book.title} on #{rent.date}"
end
puts '------'
