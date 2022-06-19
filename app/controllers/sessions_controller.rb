class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if cookies[:return_to].nil?
        redirect_to root_path
      else
        redirect_to cookies[:return_to]
      end
      cookies[:return_to] = nil
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please!'
      render :new
    end
  end
          
  def destroy
    session.delete(:user_id)
    flash.now[:alert] = 'You have succesfully logged out!'
    redirect_to root_path
  end
end
