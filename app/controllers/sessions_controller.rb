class SessionsController < ApplicationController
 # this is the SIGN INNN page
  def new
  end

  def create
    # debugger
    @user = User.find_by_credentials(params[:user][:email],
      params[:user][:password]
    )
    if @user
      # fail
      login(@user)
      p 'debugger'
       redirect_to user_url(@user)
    end

  end

  def destroy
    logout
  end


end
