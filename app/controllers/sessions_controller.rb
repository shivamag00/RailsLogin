class SessionsController < ApplicationController

  def create
    @student = Student.find_by(id: params[:id])
    if !@student.nil? && @student.password.match(params[:password])
      session[:user_id] = @student.id
      redirect_to "#{students_path}/#{@student.id}"
    else
      message = 'Something went wrong!'
      redirect_to login_path, notice: message
    end
  end
end
