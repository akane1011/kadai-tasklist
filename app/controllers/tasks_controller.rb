class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
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
     @task = Task.find(params[:id])
   end
  
  def update
    @task = Task.find(params[:id])
    
    if @task.update(tasks_params)
      flash[:success] = 'Taskは正常に更新されました'
      redirect_to tasks_path(@task)
    else
      flash.now[:danger] = 'Taskは更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = 'Taskは正常に削除されました'
    redirect_to tasks_path
  end
  
  
  private
  
  def tasks_params
    params.require(:task).permit(:content)
  end
end
