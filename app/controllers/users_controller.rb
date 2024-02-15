class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      log_in @user
      # Handle a successful save.
      flash[:success] = "Welcome, your registration is success"
      redirect_to @user
      # Еквивалентен redirect_to user_url(@user)
    else
      # передаст шаблон через /user
      render 'new', status: :unprocessable_entity
      # flash.now[:error] = @user.errors.full_messages.to_sentence
      # redirect_to signup_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
