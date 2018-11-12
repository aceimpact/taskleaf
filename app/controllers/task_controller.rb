class TaskController < ApplicationController
  
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @tasks = Task.order(created_at: :desc)
  end

  def new
    @task = current_user.tasks.build
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to root_url
    else
      render action: :new
    end
  end

  def update
    @task = Task.find_by!(id: params[:id])
    if @task.update_attributes(task_params)
      redirect_to root_url
    else
      render edit_task_path(task)
    end
  end

  def destroy
    @task = Task.find_by!(id: params[:id])
    @task.destroy!
    redirect_to root_url
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end

end
