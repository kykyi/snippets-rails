class UsersController < ApplicationController
  def new; end

  def create
    @user = User.create!(
      email: params[:email],
      password: params[:password],
      name: params[:name],
      active: true,
      created: Time.zone.now
    )
    redirect_to new_session_path, notice: 'Your signup was successful. Please log in.'
  rescue ActiveRecord::RecordInvalid => e
    redirect_to new_user_path, alert: e.message
  end

  def logout
    session[:user_id] = nil

    redirect_to root_path, notice: "You've been logged out successfully!"
  end
end
