require_relative '../corrector'

describe Corrector do
  context 'When testing the Corrector class' do
    name = 'emmanuel'
    long_name = 'emmanuel101'
    classroom = Corrector.new
    it 'should return the capitalize name' do
      expect(classroom.correct_name(name)).to eq 'Emmanuel'
    end
    it 'should return only length ten string' do
      expect(classroom.correct_name(long_name)).to eq 'Emmanuel10'
    end
  end
end
