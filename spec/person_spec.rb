require_relative '../classes/person'

describe Person do
  context 'With valid input' do
    it 'should instansiate a person with age 20' do
      per = Person.new(id: nil, age: 20)
      expect(per.age == 20).to be true
    end
  end
end
