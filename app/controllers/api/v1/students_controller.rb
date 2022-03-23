class Api::V1::StudentsController < ApplicationController 
  def show
    student = Student.find_by(name: params['name'])
    render json: StudentSerializer.new(student)
  end

  def index
    students = Student.all
    render json: StudentSerializer.new(students)
  end

  def create
    avatar = params[:avatar]
    params = student_params.except(:avatar)
    student = Student.create!(params)
    student.avatar.attach(avatar) if avatar.present? && !!student
    render json: StudentSerializer.new_avatar(student)
  end

  private

  def student_params
    params.permit(:name, :enrolled, :avatar, :about, )
  end
end