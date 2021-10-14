require_relative '../classes/rental'
require_relative '../classes/person'
require_relative '../classes/book'
require_relative '../classes/student'

describe Rental do
  context 'With valid input' do
    it 'should instansiate a rental with person Rhyine Stewart and date oct 13 2021' do
      book = Book.new(title: 'Beneath The Sea', author: '1')
      person = Student.new(id: nil, classroom: nil, name: 'Rhyine Stewart', age: 20)
      per = Rental.new(date: 'October 13, 2021', person: person, book: book)
      p per
      expect(per.date == 'October 13, 2021').to be true
    end
  end
end
