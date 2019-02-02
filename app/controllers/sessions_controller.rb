class SessionsController < ApplicationController
  def new
  end

  def create
    puts "HIIIIII"
    user = User.find_by(email: params[:session][:email].downcase)
    puts "HAS USER? #{user}"
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
      # redirect_back_or user
    else
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
