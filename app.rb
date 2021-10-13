require_relative './controller/mock_data'
require_relative './controller/manager'
require_relative './controller/menu'
require_relative './actions/create'
require_relative './actions/display'
require_relative './controller/data'

class App
  attr_accessor :manager, :menu, :data

  def initialize
    @menu = Menu.new
    @data = DataController.new
    @actions = [Create.new(data), Display.new(data), @data]
    @manager = Manager.new(menu, @actions)
  end

  def run
    menu.start
  end
end
