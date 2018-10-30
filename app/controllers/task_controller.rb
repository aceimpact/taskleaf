class TaskController < ApplicationController

  def index
    @tasks = Task.order(created_at: :desc)
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find_by!(id: params[:id])
  end

  def create
    @task = Task.new(task_params)
      if @task.save
        redirect_to root_url
      else
        render new_task_url
      end
  end

  def update
    @task = Task.find_by!(id: params[:id])
    @task.update_attributes(task_params)
    redirect_to root_url

  end

  def destroy
    @task = Task.find_by!(id: params[:id])
    @task.destroy
    redirect_to root_url
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end

end
