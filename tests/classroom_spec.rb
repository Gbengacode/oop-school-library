require_relative '../classroom'

describe Classroom do
  context 'When testing the Classroom class' do
    label = 'label'
    classroom = Classroom.new(label)
    it 'should validate the label of the classroom' do
      expect(classroom.label).to eq label
    end
    it 'should to  return instance of  the classroom' do
      expect(classroom).to be_instance_of(Classroom)
    end
  end
end
