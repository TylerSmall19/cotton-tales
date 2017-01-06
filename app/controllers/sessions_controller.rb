class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if request.xhr?
        redirect_to :back
      else
        redirect_to '/'
      end
    else
      @errors = ['Invalid username or password']
      if request.xhr?
        render partial: 'errors', status: 422
      else
        render 'new'
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :back
  end
end
