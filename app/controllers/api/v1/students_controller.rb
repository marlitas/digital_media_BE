class Api::V1::StudentsController < ApplicationController 
  def show
    student = Student.find(params['id'])
    render json: StudentSerializer.new(student)
  end

  def index
    students = Student.all
    render json: StudentSerializer.new(students)
  end
end