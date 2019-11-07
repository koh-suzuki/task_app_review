class TasksController < ApplicationController
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
      
    else
      render :new
    end
  end
  
  def index
    @tasks = Task.all
  end
  
  def edit
  end
  
  def destroy
  end
  
  def show
  end
  
  private
    def task_params
      params.require(:task).permit(:task_name, :task_description)
    end
end
