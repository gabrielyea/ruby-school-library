class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(date:, person:, book:)
    @date = date
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
  end

  def to_json(*options)
    {
      type: self.class,
      date: @date,
      id: @person.id,
      book: @book
    }.to_json(*options)
  end
end
