require_relative '../modules/input_handler_module'
require_relative '../modules/display_module'
require_relative '../modules/creator_module'
class Create
  include InputHandler
  include DisplayModule
  include CreatorModule

  def initialize(data)
    @data = data
  end

  def create_person
    teacher = Type.new(Teacher, %i[specialization name age])
    student = Type.new(Student, %i[name age parent_permission])
    types = [teacher, student]
    List_Collection.call(types, 'Types', %i[name], Display_By_Class_Name)

    args = Show_Prompt.call(person.required_params)
    @data.people << person.name.new(**args)
  end

  def create_book
    book = Type.new(Book, %i[title author])
    args = Show_Prompt.call(book.required_params)
    @data.books << book.name.new(**args)
  end

  def create_rental
    Show_Prompt_With_Callback.call(%i[id], 'Enter index number of book', @data.books, callback: Get_By_Index)
  end
end
