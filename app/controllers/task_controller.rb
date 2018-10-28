class TaskController < ApplicationController

  def index
    @tasks = Task.all.order(created_at: :desc)
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new (task_params)
      if @task.save
        redirect_to :action => "index"
      else
        render :action => "new"
      end
  end

  def update

  end

  def destroy
  end

  private

  def task_params
    params.permit(:task_name,:description)
  end

end
