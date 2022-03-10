require_relative '../person'

describe Person do
  context 'When testing the person class do' do
    age = 23
    name = 'emmanuel'
    new_person = Person.new(age, name)
    it 'it should return an instance of the class' do
      expect(new_person).to be_instance_of(Person)
    end

    it 'should return the age passed in the class instance' do
      expect(new_person.age).to equal(age)
    end

    it 'should return the name passed in the class instance' do
      expect(new_person.name).to equal(name)
    end

    it 'should return the title passed in the class instance' do
      expect(new_person.can_use_services?).to be true
    end

    it 'should return the Capitalize name passed in the class instance' do
      expect(new_person.validate_name).to eq 'Emmanuel'
    end
  end
end
