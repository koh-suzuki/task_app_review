class TasksController < ApplicationController
  
  def new
    
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
end
