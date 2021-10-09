require_relative 'rental'
class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title:, author: 'Anonymous')
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, person, self)
  end
end
