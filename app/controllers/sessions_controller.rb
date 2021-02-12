class SessionsController < ApplicationController

  # For creating session
  def create
    @student = Student.find_by(id: params[:id])
    if !@student.nil? && @student.password.match(params[:password])
      session[:user_id] = @student.id
      redirect_to root_url
    else
      message = 'Username or Password is wrong!'
      redirect_to login_path, notice: message
    end
  end

  # For Destroying session
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
