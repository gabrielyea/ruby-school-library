require_relative './controller/mock_data'
require_relative './controller/manager'
require_relative './controller/menu'
require_relative './actions/create'
require_relative './actions/display'

class App
  attr_accessor :manager, :menu, :data

  def initialize
    @menu = Menu.new
    @data = Mock.new
    @actions = [Create.new(data), Display.new(data)]
    @manager = Manager.new(menu, @actions)
  end

  def run
    menu.start
  end
end
