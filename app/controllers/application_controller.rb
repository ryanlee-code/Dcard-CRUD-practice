class ApplicationController < ActionController::Base
  include SessionsHelper
  
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private
    def session_required
      redirect_to sign_in_users_path, notice: '請先登入' if not current_user
    end

    def record_not_found
      render file: '/public/404.html' ,layout: false,status: 404
    end
end
