class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

      # beforeフィルター
  
  def logged_in
    unless logged_in?
      flash[:success] = "ログインしてください。"
      redirect_to root_path
    end
  end
  
  def admin_user?
    redirect_to root_path unless current_user.admin?
  end
  
  def person
    @user = User.find(params[:id])
    redirect_to root_path unless current_user?(@user)
  end
  
  def admin_or_correct_user
    @user = User.find(params[:user_id]) if @user.blank?
    unless current_user?(@user) || current_user.admin?
      flash[:danger] = "編集権限がありません。"
      redirect_to(root_url)
    end  
  end
  
  def correct_user
    redirect_to root_url unless current_user?(@user)
  end
end
