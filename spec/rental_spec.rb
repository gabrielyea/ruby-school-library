require_relative '../classes/rental'

describe Rental do
  context 'With valid input' do
    it 'should instansiate a rental with person Rhyine Stewart' do
      per = Rental.new(date: 'October 13, 2021', person: 'Rhyine Stewart', book: 'Beneath The Sea')
      expect(per.date == 'October 13, 2021').to be true
    end
  end
end
