class UsersController < ApplicationController
  before_action :set_user, only: [:show]


  # GET /users/1
  # GET /users/1.json
  def show
    @calenders = @user.calenders
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to @user, notice: '成改修改個人資料！'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:password, :password_confirmation, :nickname)
    end
end
