require_relative 'helpers'
require_relative 'book'
require_relative 'student'
require_relative 'classroom'
require_relative 'teacher'
require_relative 'rental'

class App
  include Helpers
  attr_accessor :all_options, :books, :people, :rentals

  Option = Struct.new(:desc, :ref)

  def initialize
    @all_options = [
      Option.new('- List all books', method(:list_all_books)),
      Option.new('- List all people', method(:list_all_people)),
      Option.new('- Create a person', method(:create_person)),
      Option.new('- Create a book', method(:create_book)),
      Option.new('- Create a rental', method(:create_rental)),
      Option.new('- List all rentals for a given person id', method(:list_rentals_by_id)),
      Option.new('- Exit', method(:exit))
    ]

    classroom1 = ClassRoom.new('101')
    student_a = Student.new(classroom: classroom1, name: 'gabriel', age: '20')
    student_b = Student.new(classroom: classroom1, name: 'leo', age: '30')
    teacher = Teacher.new('Biology', name: 'Mr. Profesor', age: '50')
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

  def list_all_books
    List_Collection.call(books, 'Books', %i[title author], Nomral_Display)
  end

  def list_all_people
    List_Collection.call(people, 'People', %i[id name age], Nomral_Display)
  end

  def create_person
    p 'create create_person'
  end

  def create_book
    loop do
      puts 'Enter book title'
      title = gets.strip
      puts 'Enter book author'
      author = gets.strip
      books << Book.new(title: title, author: author)
      puts 'Book created!'
      puts 'Hit enter to continue!'
      break if gets.strip
    end
  end

  def create_rental
    p 'create create_rental'
  end

  def list_rentals_by_id
    List_Collection.call(rentals, 'Rentals', %i[date name title], Display_By_Id, @people[0].id)
  end

  def exit
    p 'Good bye!'
  end

  def display_menu
    puts 'Select an option by writing its number'
    all_options.each_with_index do |op, index|
      p "#{index + 1} #{op.desc}"
    end
  end

  def run
    loop do
      display_menu
      user_input = gets.chomp.to_i
      all_options[user_input - 1].ref.call

      break if user_input == 7
    end
  end
end

@app = App.new
@app.run

# def display_menu
#   puts 'Select an option by writing its number'
#   @app.all_options.each_with_index do |op, index|
#     p "#{index + 1} #{op.desc}"
#   end
# end

# loop do
#   display_menu
#   user_input = gets.chomp.to_i
#   @app.all_options[user_input - 1].ref.call

#   break if user_input == 7
# end
