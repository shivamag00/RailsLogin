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
      # redirect_to login_path, notice: "Created id - #{@student.id}"
      render plain: "Created id - #{@student.id} <br> Click <a href='/login'> Click Here</a> to Login"
    else
      errors = "ERRORS <br>"
      @student.errors.each do |attribute, message|
        errors += "<li>#{attribute} - #{message}</li>"
      end
      render plain: "#{errors} <br> Please fill the form again"
    end
  end

  def show
    @student = Student.all
  end

  private

  def student_params
    params.require(:student).permit(:name, :sem, :gender, :address, :password, :password_confirmation)
  end
end
