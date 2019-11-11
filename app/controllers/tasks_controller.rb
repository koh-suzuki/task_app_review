class TasksController < ApplicationController
  before_action :logged_in
  before_action :person
  
  def new
    @task = Task.new
  end
  
  def create
    @task = @user.tasks.build(task_params)
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_path(@user.id)
    else
      render :new
    end
  end
  
  def index
    @tasks = @user.tasks
  end
  
  def edit
    @task = @user.tasks.find(params[:id])
  end
  
  def update
    @task = @user.tasks.find(params[:id])
    if @task.update_attributes(task_params)
      flash[:success] = "更新しました。"
    end
    redirect_to user_task_path(@user, @task)
  end
  
  def destroy
    @task = @user.tasks.find(params[:id])
    if @task.destroy
      flash[:success] = "削除しました。"
    end
    redirect_to user_tasks_path @user
  end
  
  def show
    @task = @user.tasks.find(params[:id])
  end
  
  private
    def task_params
      params.require(:task).permit(:task_name, :task_description)
    end
end
