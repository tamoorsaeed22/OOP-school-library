require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before :each do
    @classroom = Classroom.new('d121')
    @student = Student.new('1', 17, name: 'Rosy')
  end
  context 'When creating a new Classroom class' do
    it 'should have a label property' do
      expect(@classroom.label).to eql 'd121'
    end
    it 'the label should be a string' do
      expect(@classroom.label).to be_kind_of String
    end
    it 'should be an instance of the Classroom class' do
      expect(@classroom).to be_instance_of Classroom
    end
  end
  context 'When adding classroom for the Student' do
    it 'can add a student' do
      expect(@classroom).to respond_to(:add_student)
    end
    it 'Can add new Student for the Classroom' do
      @classroom.add_student(@student)
      expect(@classroom.students.count).to eq(1)
    end
    it 'Should assign classroom to student upon adding the student to the classroom' do
      expect(@student.classroom).to eql '1'
      @classroom.add_student(@student)
      expect(@student.classroom.label).to eql 'd121'
    end
  end
end
