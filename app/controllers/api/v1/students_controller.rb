class Api::V1::StudentsController < ApplicationController 
  def show
    student = Student.find(params['id'])
    render json: StudentSerializer.new(student)
  end

  def index

  end
end