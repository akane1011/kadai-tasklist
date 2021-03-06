class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_task, only: [:show, :edit, :update, :destroy]
 
  
  def index
    @tasks = current_user.tasks.page(params[:page])
  end
  
  def show
   set_task
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.build(tasks_params)
    
    if @task.save
      flash[:success] = 'Taskが正常に送信されました'
      redirect_to @task 
    else
      flash.now[:denger] = 'Taskが送信されませんでした。'
      render :new
    end
  end
  
   def edit
     set_task
   end
  
  def update
   if @task.update(tasks_params)
      flash[:success] = 'Taskは正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskは更新されませんでした'
      render :edit
   end
  end
  
  def destroy
    @task.destroy
    flash[:success] = 'Taskは正常に削除されました'
    redirect_back(fallback_location: root_path)
  end
  
  
  
  private
  
  def set_task
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url(@user) and return
    end
  end
  
  def tasks_params
    params.require(:task).permit(:content, :status)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
end
