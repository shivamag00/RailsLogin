class StudentsController < ApplicationController

  def current_user
    @current_user ||= Student.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @student = Student.find(params[:id])
    render plain: @student.name
  end

  private

  def student_params
    params.require(:student).permit(:name, :sem, :gender, :address, :password)
  end
end
