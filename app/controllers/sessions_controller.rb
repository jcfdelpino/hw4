class SessionsController < ApplicationController
  def new
  end

  def create
    entered_email = params["email"]
    entered_password = params["password"]
    @user = User.find_by({email:entered_email})

    if @user 
      if BCrypt::Password.new(@user.password) == entered_password
        session[:user_id]= @user.id
        flash[:notice] = "Welcome!"
        redirect_to "/places"
      else
        flash[:notice] = "Give that password another shot.."
        redirect_to "/sessions/new"
      end
    else
      flash[:notice] = "Try that email again.."
      redirect_to "/sessions/new"  
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/sessions/new"
  end
end
  