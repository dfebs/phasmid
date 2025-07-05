class UsersController < ApplicationController
  allow_unauthenticated_access only: %i[new create]
  before_action :authenticate_user, only: %i[edit update]

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path, notice: "User created! Time to log in."
    else
      redirect_to new_user_path, alert: "User failed to be created!"
    end
  end

  def edit
  end

  def update
    # todo put something here
  end

  private
  def user_params
    params.expect(user: [ :username, :email_address, :password, :password_confirmation, :time_zone ])
  end

  def set_user
    @user = User.find(params[:id])
  end

  def authenticate_user
    set_user
    if Current.user != @user
      redirect_to root_path, alert: "You are not allowed to perform this action."
    end
  end
end
