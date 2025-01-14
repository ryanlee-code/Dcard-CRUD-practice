class RegistrationsController < ApplicationController
  before_action :session_required, only: [:edit, :update]

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

  def edit
    
  end
  
  def update
    if current_user.update(clear_user)
      redirect_to edit_users_path, notice: '更新成功'
    else
      
    end
  end
  private
    def clear_user
      params.require(:user).permit(:email, :password ,:password_confirmation, :nickname)
    end
end
