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
    redirect_to root_path
  rescue ActiveRecord::RecordInvalid => e
    redirect_to new_user_path, alert: e.message
  end
end
