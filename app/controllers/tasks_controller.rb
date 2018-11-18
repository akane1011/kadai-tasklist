class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end
  
  def show
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(tasks_params)
    
    if @task.save
      flash[:success] = 'Taskが正常に送信されました'
      redirect_to @task 
    else
      flash.now[:denger] = 'Taskが送信されませんでした。'
      render :new
    end
  end
  
   def edit
   end
  
  def update
   if @task.update(tasks_params)
      flash[:success] = 'Taskは正常に更新されました'
      redirect_to tasks_path(@task)
    else
      flash.now[:danger] = 'Taskは更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @task.destroy
    
    flash[:success] = 'Taskは正常に削除されました'
    redirect_to tasks_path
  end
  
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  def tasks_params
    params.require(:task).permit(:content, :status)
  end
end
