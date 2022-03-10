require_relative '../student'

describe Student do
  context 'When testing the student class do' do
    age = 10
    name = 'john'
    symbol = "¯\(ツ)/¯"
    new_student = Student.new(age, name)
    it 'it should return an instance of the class' do
      expect(new_student).to be_instance_of(Student)
    end

    it 'should return the age of the student' do
      expect(new_student.age).to eq age
    end

    it 'should return the play_hooky symbol for student' do
      expect(new_student.play_hooky).to eq symbol
    end
  end
end
