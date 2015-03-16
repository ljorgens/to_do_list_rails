class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end


  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      flash[:notice] = "Task successfully added!"
      redirect_to list_path(@task.list)
    else
      render :new
    end
  end

def edit
  @task = Task.find(params[:id])
end

def update
  @list = List.find(params[:id])
  @task.update(task_params)
  redirect_to lists_path
end

def destroy
  @list = List.find(params[:id])
  if @list.destroy
    flash[:destroyed] = "that is gone"
  end
  redirect_to lists_path
end




private
  def task_params
    params.require(:task).permit(:description)
  end
end
