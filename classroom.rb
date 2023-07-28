class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(students)
    @students.push(students)
    student.Classroom = self
  end
end
