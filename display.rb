require_relative './modules/display_module'

class Display
  include DisplayModule
  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def list_all_people
    List_Collection.call(data.people, 'People', %i[name age], Display_By_Labels)
  end

  def list_all_books
    puts 'a list of books'
    p data.books
  end
end
