require 'observer'

class Menu
  include Observable
  attr_accessor :all_options

  Option = Struct.new(:desc, :ref)

  def initialize
    @all_options = [
      Option.new('- List all books', :list_all_books),
      Option.new('- List all people', :list_all_people),
      Option.new('- Create a person', :create_person),
      Option.new('- Create a book', :create_book),
      Option.new('- Create a rental', :create_rental),
      Option.new('- List all rentals for a given person id', :list_rentals_by_id),
      Option.new('- Exit', :exit)
    ]
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

  def start
    changed
    notify_observers(:load_from_file)
    loop do
      display_menu
      user_input = gets.chomp.to_i

      next if user_input > all_options.length

      op = all_options[user_input - 1].ref
      changed
      notify_observers(op)

      break if user_input == 7
    end
    changed
    notify_observers(:save_data)
  end
end
