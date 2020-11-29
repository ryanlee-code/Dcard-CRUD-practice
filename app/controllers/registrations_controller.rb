class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(clear_user)
    if @user.save
      redirect_to '/',notice: "註冊成功"
    else
      render :new
    end
  end

  private
    def clear_user
      params.require(:user).permit(:email, :password ,:password_confirmation, :nickname)
    end
end
