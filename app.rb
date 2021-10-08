require_relative 'helpers'
require_relative 'book'
require_relative 'student'
require_relative 'classroom'
require_relative 'teacher'
require_relative 'rental'

class App
  include Helpers
  attr_accessor :all_options, :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
    @all_options = [
      Option.new('- List all books', method(:list_all_books)),
      Option.new('- List all people', method(:list_all_people)),
      Option.new('- Create a person', method(:create_person)),
      Option.new('- Create a book', method(:create_book)),
      Option.new('- Create a rental', method(:create_rental)),
      Option.new('- List all rentals for a given person id', method(:list_rentals_by_id)),
      Option.new('- Exit', method(:exit))
    ]
  end

  def list_all_books
    Clear_Display.call
    List_Collection.call(@books, 'Books', %i[title author], Display_By_Labels)
  end

  def list_all_people
    Clear_Display.call
    List_Collection.call(@people, 'People', %i[name age specialization], Display_By_Labels)
  end

  def create_person
    Clear_Display.call
    teacher = Type.new(Teacher, %i[specialization name age])
    student = Type.new(Student, %i[name age parent_permission])
    types = [teacher, student]
    List_Collection.call(types, 'Types', %i[name], Display_By_Class_Name)
    puts '**Creating Person**'
    loop do
      puts '* Select a type of person by number'
      op = gets.strip.to_i
      person = Get_By_Index.call(types, op - 1)

      next unless person

      puts "**Currently creating a #{person.name}**"

      Create_Entity.call(person, @people)
      break if gets.strip
    end
  end

  def create_book
    Clear_Display.call
    book = Type.new(Book, %i[title author])
    puts '**Creating Book**'
    loop do
      Create_Entity.call(book, @books)
      break if gets.strip
    end
  end

  def create_rental
    Clear_Display.call

    puts '**Creating Rental**'
    loop do
      list_all_books
      puts '* Select a book by number'
      op = gets.strip.to_i
      book = Get_By_Index.call(@books, op - 1)
      next unless book

      list_all_people
      puts '* Select a person by number'
      op = gets.strip.to_i
      person = Get_By_Index.call(@people, op - 1)
      next unless person

      puts '* Enter a date'
      op = gets.strip.to_s
      @rentals << Rental.new(date: op, person: person, book: book)
      puts 'Rent added!!'
      puts 'Hit enter to continue!'
      break if gets.strip
    end
  end

  def list_rentals_by_id
    Clear_Display.call
    puts '* Select a person by ID'
    List_Collection.call(@people, 'People', %i[id name], Display_By_Labels)

    op = gets.strip.to_i

    List_Collection.call(@rentals, 'Rentals', %i[date name title], Display_By_Id, op)
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

      next if user_input > all_options.length

      all_options[user_input - 1].ref.call

      break if user_input == 7
    end
  end
end
