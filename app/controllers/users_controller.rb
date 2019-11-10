class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in, only: [:index, :show, :update, :destroy]
  before_action :admin_user?
  before_action :person
  before_action :admin_or_correct_user
  
  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end
  
  def show
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    @user.update(user_params)
    flash[:success] = "ユーザー情報を更新しました。"
    redirect_to @user
  end
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    # beforeフィルター
    
    def set_user
      @user = User.find(params[:id])
    end
    
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
      redirect_to root_path unless current_user == @user
    end
    
    def admin_or_correct_user
      @user = User.find(params[:id]) if @user.blank?
      unless current_user?(@user) || current_user.admin?
        flash[:danger] = "編集権限がありません。"
        redirect_to(root_url)
      end  
    end
    
end
