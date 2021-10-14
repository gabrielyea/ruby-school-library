require_relative '../classes/corrector'

describe Corrector do
  context 'With valid input' do
    it 'should capitalize the first letter of a given name' do
      per = Corrector.new
      expect(per.correct_name('rhyine') == 'Rhyine').to be true
    end
  end
end
