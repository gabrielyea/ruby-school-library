require_relative '../classes/teacher'

describe Person do
  context 'With valid input' do
    it 'should instansiate a student with age 20' do
      per = Teacher.new(id: nil, name: 'Professor', age: 20, specialization: 'Biology')
      expect(per.name == 'Professor').to be true
    end
  end
end
