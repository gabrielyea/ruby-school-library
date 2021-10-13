require_relative '../classes/book'

describe Book do
  context 'With valid input' do
    it 'should instansiate a book with title Meeting Place' do
      per = Book.new(title: 'Meeting Place', author: 'Rhyine Stewart')
      expect(per.title == 'Meeting Place').to be true
    end
  end
end
