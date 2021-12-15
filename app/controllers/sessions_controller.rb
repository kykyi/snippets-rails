class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email]).authenticate(params[:password])
    session[:user_id] = user.id

    redirect_to new_snippet_path
  rescue ActiveRecord::RecordNotFound => e
    redirect_to new_session_path, alert: e.message
  end

  def destroy
    session[:user_id] = nil

    redirect_to root_path
  end
end
