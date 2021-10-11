require_relative '../modules/input_handler_module'
require_relative '../modules/display_module'

class Create
  include InputHandler
  include DisplayModule

  def initialize(data)
    @data = data
  end

  def create_person
    teacher = Type.new(Teacher, %i[specialization name age])
    student = Type.new(Student, %i[name age parent_permission])
    types = [teacher, student]
    List_Collection.call(types, 'Types', %i[name], Display_By_Class_Name)

    @data.people << person.name.new(**Show_Prompt.call(person.required_params))
  end

  def create_book
    book = Type.new(Book, %i[author title])
    @data.books << book.name.new(**Show_Prompt.call(book.required_params))
  end

  def create_rental
    List_Collection.call(@data.books, 'Books', %i[title], Display_Table)
    book = Show_Prompt_With_Callback.call(
      %i[index], 'Enter index number of the book', @data.books, callback: Get_By_Index
    )

    List_Collection.call(@data.people, 'Person', %i[name], Display_Table)
    person = Show_Prompt_With_Callback.call(
      %i[index], 'Enter index number of the person', @data.people, callback: Get_By_Index
    )

    date = Show_Prompt.call(%i[date])

    @data.rentals << Rental.new(date: date[:date].to_s, person: person, book: book)
  end
end
