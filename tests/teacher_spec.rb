require_relative('../teacher')
require_relative('../person')

describe do
  context 'When testing the book class do' do
    age = 23
    name = 'emmanuel'
    specialization = 'maths'
    teacher = Teacher.new(age, name, specialization)
    it 'it should return an instance of the class' do
      expect(teacher).to be_instance_of(Teacher)
    end
    it 'should return the age of the teacher' do
      expect(teacher.age).to eq age
    end

    it 'should return the name of the teacher' do
      expect(teacher.name).to eq name
    end

    it 'should return parent permission for teacher' do
      expect(teacher.specialization).to eq specialization
    end
  end
end
