class SessionsController < ApplicationController
  before_action :login_user, only: [:new]
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      flash[:success] = "ログインしました。"
      redirect_to user
    else
      flash.now[:danger] = '認証に失敗しました。'
      render :new
    end
  end
  
  def destroy
    log_out if logged_in?
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  
   private
     # # ログイン中の他ユーザーの制限
    def login_user
      if logged_in?
        flash[:info] = "すでにログインしています。"
        redirect_to user_url current_user
      end
    end
end
