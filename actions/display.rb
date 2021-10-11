require_relative '../modules/display_module'
require_relative '../modules/input_handler_module'

class Display
  include DisplayModule
  include InputHandler
  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def list_all_people
    List_Collection.call(data.people, 'People', %i[name age], Display_Table)
  end

  def list_all_books
    List_Collection.call(data.books, 'Books', %i[title author], Display_Table)
  end

  def list_rentals_by_id
    List_Collection.call(data.people, 'People', %i[id name], Display_Table)
    results = Show_Prompt_With_Callback.call(%i[index], 'Enter the id of the person', data.rentals, callback: Get_By_Id)
    List_Collection.call(results, 'Results', %i[name title date], Display_Table)
  end
end
