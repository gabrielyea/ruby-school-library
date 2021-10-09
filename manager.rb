require_relative 'menu'
require_relative 'create'
require_relative 'display'
require_relative 'data'
require_relative 'mock_data'

class Manager
  attr_accessor :actions

  def initialize(obs, actions)
    obs.add_observer(self)
    @actions = actions
  end

  def update(msg)
    actions.each do |action|
      action.respond_to?(msg) && action.send(msg)
    end
  end
end

mock = Mock.new
data = Data.new

actions = [Create.new(data), Display.new(mock)]
menu = Menu.new
Manager.new(menu, actions)
menu.run
