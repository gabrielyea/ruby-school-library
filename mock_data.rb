require_relative './classes/student'
require_relative './classes/classroom'
require_relative './classes/book'
require_relative './classes/rental'
require_relative './classes/teacher'

class Mock
  attr_accessor :people, :rentals, :books

  def initialize
    classroom1 = ClassRoom.new(label: '101')
    student_a = Student.new(classroom: classroom1, name: 'gabriel', age: '20')
    student_b = Student.new(classroom: classroom1, name: 'leo', age: '30')
    teacher = Teacher.new(specialization: 'Biology', name: 'Mr. Profesor', age: '50')
    book_a = Book.new(title: 'OOP and OOD with Ruby examples')
    book_b = Book.new(title: 'Twenty Thousand Leagues under the Sea', author: 'Julio Verne')
    book_c = Book.new(title: 'The Picture of Dorian Gray', author: 'Oscar Wilde')
    rent_a = Rental.new(date: 'today', person: student_a, book: book_a)
    rent_b = Rental.new(date: 'yesterday', person: student_b, book: book_b)
    rent_c = Rental.new(date: 'tomorrow', person: student_a, book: book_c)

    @books = [book_a, book_b, book_c]
    @people = [student_a, teacher, student_b]
    @rentals = [rent_a, rent_b, rent_c]
  end
end
