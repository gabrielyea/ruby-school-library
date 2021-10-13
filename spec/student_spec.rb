require_relative '../classes/student'

describe Person do
  context 'With valid input' do
    it 'should instansiate a student with age 20' do
      per = Student.new(id: nil, age: 20, classroom: nil)
      expect(per.age == 20).to be true
    end
  end
end
