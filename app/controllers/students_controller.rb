class StudentsController < ApplicationController

  def index; end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :sem, :gender, :address)
  end
end
